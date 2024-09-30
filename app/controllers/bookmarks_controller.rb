class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.find(params[:id])
    @bookmark = @category.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to category_path(@category)
    else
      render :new, sstatus: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to category_path(@category)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :recipe_id)
  end
end
