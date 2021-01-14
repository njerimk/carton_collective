class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string :title
      t.text :comic_desc

      t.timestamps
    end
  end
end
