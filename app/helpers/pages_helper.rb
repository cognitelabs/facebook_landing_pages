module PagesHelper

  def add_to_page_link(page)
    link = "https://www.facebook.com/dialog/pagetab?app_id=#{APP_CONFIG.fb_app_id}&redirect_uri=#{page_added_to_facebook_pages_url(page_id: page.id)}"
    link_to "Add to Facebook Page", link, class: 'btn btn-primary'
  end
end
