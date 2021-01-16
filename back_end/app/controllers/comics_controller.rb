class ComicsController < ApplicationController
  def index
    comics = Comic.all 
    render json: ComicSerializer.new(comics).to_serialized_json
  end

  def show
    @comic = Comic.find(params[:id])
    @like = @comic.likes.new
    render json:  ComicSerializer.new(@comic).to_serialized_json
  end

   def create  
    @comic = Comic.create(comic_params)
    redirect_to new_comic_path
  end
  
  def new
    @comic = Comic.new
  end

 

  def update
    @comic = Comic.find(params[:id])
      if @comic.update_attributes(params[:comic])
        redirect_to :action => 'show', :id => @comic
      else
        @comic = comic.find(:all)
        render :action => 'edit'
      end

  end

  def edit  
    @comic = Comic.find(params[:id])
  end

  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy
    redirect_to '/comics/new', :notice => "Your comic has been deleted"
  end

private 
  def comic_params
    params.require(:comic).permit(:title, :comic_desc, :likes, :image)
  end


end
