class UsersController < ApplicationController
  def index
    @users = User.all 
    render json: UserSerializer.new(@users).to_serialized_json
  end

  def show
    @user = User.find_by(params[:id])
    @like = @user.likes.new
    @comment = @user.comments.new
    render json:  UserSerializer.new(@user).to_serialized_json
  end

  def new
    @user = User.new
  end

  def create  
    @user = User.create(user_params)
    redirect_to new_comic_path
  end

  def update
    @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        redirect_to :action => 'show', :id => @user
      else
        @user = user.find(:all)
        render :action => 'edit'
      end

  end

  def edit  
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/users/new', :notice => "Your user has been deleted"
  end

private 
  def user_params
    params.require(:user).permit(:user_name, :user_description, :created_at, :comments, :likes, :image)
  end
end
