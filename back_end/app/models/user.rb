class User < ApplicationRecord
    has_many: page_comments
    has_many: user_comics
    has_many: comics, through: user_comics
    
end
