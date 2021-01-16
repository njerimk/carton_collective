class ComicPage < ApplicationRecord
    belongs_to :comic
    has_many :comments
    has_many :comments, as: :commentable
    has_one_attached :image
end
