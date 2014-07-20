class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :token
      t.text :html
      t.text :css
      t.belongs_to :user
      t.timestamps
    end
  end
end
