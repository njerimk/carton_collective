class CommentsController < ApplicationController
  
  def index
    comment = Comment.all 
    render json: CommentSerializer.new(comment).to_serialized_json
  end

  def show
    comment = Comment.find_by(id: params[:id])
    render json: CommentSerializer.new(comment).to_serialized_json

    # @parent = parent
    # @comment = @parent.comments.new comment_params
    # @comment.save
  end

  def new
    @comment = Comment.new
  end

  def create
    @parent  = parent
    @comment = @parent.comments.new comment_params
    @comment.save
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to :action => 'show', :id => @comment
    else
      @comment = comment.find(:all)
      render :action => 'edit'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to '/comments/new'
  end

  private

  def parent 
    return ComicPage.find params[:comic_page_id] if params[:comic_page_id]
    User.find params[:user_id] if params[:user_id] 
  end

  def comment_params
    params.require(:comment).permit(:id, :context, :created_at, :comic_page, :user)
    # permit(:body).merge(user_id: current_user.id)
  end 

end
