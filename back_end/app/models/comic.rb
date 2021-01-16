class Comic < ApplicationRecord
    has_many :likes
    has_many :likes, as: :likeable
    has_many :comic_pages 
    has_many :user_comics
    has_many :users, through: :user_comics
    has_one_attached :image
end
