class ComicPagesController < ApplicationController
  
  def index
        @comic_pages = ComicPage.all 
        render json: ComicPageSerializer.new(@comic_pages).to_serialized_json
  end

  def show
      @comic_page = ComicPage.find_by(id: params[:id])
      @comment = @comic_page.comments.new
      render json:  ComicPageSerializer.new(@comic_page).to_serialized_json
  end

  def new
    @comic_page = ComicPage.new
  end

  def create
    @comic_page = ComicPage.create(comic_page_params)
    redirect_to new_comic_page_path
  end

  def update
    @comic_page = ComicPage.find(params[:id])
    if @comic_page.update_attributes(params[:comic_page])
      redirect_to :action => 'show', :id => @comic_page
    else
      @comic_page = comic_page.find(:all)
      render :action => 'edit'
    end

  end

  def edit
      @comic_page = ComicPage.find(params[:id])
  end

  def destroy
    @comic_page = ComicPage.find(params[:id])
    @comic_page.destroy
    redirect_to '/comic_pages/new', :notice => "Your comic_page has been deleted"

  end

  private 
  def comic_page_params
    params.require(:comic_page).permit(:page_desc, :comic_id, :comments, :image)
  end

end
