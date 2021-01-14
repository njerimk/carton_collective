class ComicPage < ApplicationRecord
    belongs_to: comic
    has_many: page_comments
    has_many: users, through: page_comments
end
