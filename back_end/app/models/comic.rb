class Comic < ApplicationRecord
    has_many: comic_likes
    has_many: comic_pages 
    has_many: user_comics
    has_many: users, through: user_comics

end
