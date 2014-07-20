class ChangeTypeOfFbPageId < ActiveRecord::Migration
  def change
    remove_column :facebook_pages, :fb_page_id
    add_column :facebook_pages, :fb_page_id, :string
  end
end
