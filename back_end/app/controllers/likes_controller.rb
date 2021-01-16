class LikesController < ApplicationController
  def index
    likes = Like.all 
    render json: LikeSerializer.new(likes).to_serialized_json
  end

  def show
    @parent = parent
    @like = @parent.likes.new like_params
    @like.save
  end

  def new
    @like = Like.new
  end

  def create
    @like = Like.create(like_params)
    redirect_to new_like_path
  end

  def update
    @like = Like.find(params[:id])
      if @like.update_attributes(params[:like])
        redirect_to :action => 'show', :id => @like
      else
        @like = like.find(:all)
        render :action => 'edit'
      end
  end

  def edit
    @like = Like.find(params[:id])
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to '/likes/new'
  end

  def parent 
    return Comic.find params[:like_id] if params[:like_id]
    User.find params[:user_id] if params[:user_id]
  end

  def like_params
    params.require(:like).permit(:body).merge(user_id: current_user.id)
  end 
  
end
