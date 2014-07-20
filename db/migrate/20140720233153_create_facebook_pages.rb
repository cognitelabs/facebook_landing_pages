class CreateFacebookPages < ActiveRecord::Migration
  def change
    remove_column :pages, :fb_page_id
    create_table :facebook_pages do |t|
      t.integer :fb_page_id
      t.integer :page_id

      t.timestamps
    end
  end
end
