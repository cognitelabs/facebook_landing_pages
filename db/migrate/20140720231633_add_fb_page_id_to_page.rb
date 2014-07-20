class AddFbPageIdToPage < ActiveRecord::Migration
  def change
    add_column :pages, :fb_page_id, :string
  end
end
