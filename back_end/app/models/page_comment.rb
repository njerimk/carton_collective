class PageComment < ApplicationRecord
    belongs_to: user
    belongs_to: comic_page
end
