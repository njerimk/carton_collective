class UserSerializer 

    attr_writer :image_url

    def initialize(user_object)
        @user = user_object
    end
    
    def to_serialized_json
        @user.to_json(:include => {
        :likes => {:only => [:id, :num_likes]},
        :comics=>{:only => [:id, :title, :created_at]},
        :comments => {:except => [:updated_at]}
        })
    end

    def comics
        Comic.with_attached_image.where(user_id: object.id)
    end

    def image_url
        variant = object.image.variant(resize: "110x110")
        return rails_representation_url(variant, only_path: true)
    end 
end
