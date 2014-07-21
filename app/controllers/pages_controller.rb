class PagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:page_contents]

  before_filter :allow_iframe_requests, only: [:page_contents]
  before_filter :process_signed_request, only: [:page_contents]

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def page_contents
    @fb_page = FacebookPage.find_by(fb_page_id: @fb_page_id)
    @page = @fb_page.page
    render :page_contents, layout: false
  end

  def page_added_to_facebook
    @page = Page.find(params[:page_id])
    if params[:tabs_added]
      tabs_added = params[:tabs_added]
      tabs_added.each do |fb_page_id, added|
        if added == "1"
          fb_page = FacebookPage.find_by(fb_page_id: fb_page_id)
          if fb_page
            fb_page.update_attributes(page_id: @page.id)
          else
            fb_page = FacebookPage.create(fb_page_id: fb_page_id, page_id: @page.id)
          end
        end
      end
    end
    redirect_to @page
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(page_params)
    @page.user = current_user
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  def page_params
    params.require(:page).permit(:name, :html, :css)
  end

  def process_signed_request
    if params[:signed_request]
      oauth = Koala::Facebook::OAuth.new(APP_CONFIG.fb_app_id, APP_CONFIG.fb_secret)
      signed_request = oauth.parse_signed_request(params[:signed_request])
      session[:signed_request] = signed_request
      @fb_page_id = signed_request["page"]["id"]
    end
  end

  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end
end
