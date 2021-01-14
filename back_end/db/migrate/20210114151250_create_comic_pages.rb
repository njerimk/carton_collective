class CreateComicPages < ActiveRecord::Migration[6.0]
  def change
    create_table :comic_pages do |t|
      t.string :page_name
      t.text :page_desc
      t.integer :comic_id

      t.timestamps
    end
  end
end
