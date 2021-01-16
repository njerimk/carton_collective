class User < ApplicationRecord
    has_many :comments
    has_many :comments, as: :commentable
    has_many :likes, as: :likeable
    has_many :user_comics
    has_many :comics, through: :user_comics
    has_one_attached :image
end
