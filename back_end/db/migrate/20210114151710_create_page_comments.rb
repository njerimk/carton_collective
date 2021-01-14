class CreatePageComments < ActiveRecord::Migration[6.0]
  def change
    create_table :page_comments do |t|
      t.integer :user_id
      t.integer :comic_page_id
      t.text :comment_text

      t.timestamps
    end
  end
end
