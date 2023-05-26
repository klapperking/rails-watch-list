class BookmarksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to(list_path(@list))
    else
      @review = Review.new
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.destroy

    redirect_to(list_path(params[:list_id]))
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(%i[movie_id comment])
  end
end
