class ComicSerializer 
    attr_writer :image_url

    def initialize(comic_object)
        @comic = comic_object
    end
    
    def to_serialized_json
        @comic.to_json(:include => {
        :likes => {:only => [:id, :num_likes]},
        :users=>{:only => [:id, :user_name]},
        :comic_pages =>{:except => [:page_desc, :updated_at]}
        })
    end

    def users
        User.with_attached_image.where(comic_id: object.id)
    end

    def comic_pages
        ComicPage.with_attached_image.where(comic_id: object.id)
    end

    def image_url
        variant = object.image.variant(resize: "300x300")
        return rails_representation_url(variant, only_path: true)
    end 


end 