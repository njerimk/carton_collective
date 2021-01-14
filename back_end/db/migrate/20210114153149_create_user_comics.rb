class CreateUserComics < ActiveRecord::Migration[6.0]
  def change
    create_table :user_comics do |t|
      t.integer :user_id
      t.integer :comic_id

      t.timestamps
    end
  end
end
