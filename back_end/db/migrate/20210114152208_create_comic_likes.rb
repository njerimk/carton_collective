class CreateComicLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :comic_likes do |t|
      t.integer :user_id
      t.integer :comic_id
      t.integer :num_likes

      t.timestamps
    end
  end
end
