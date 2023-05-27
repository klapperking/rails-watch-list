class MoviesController < ApplicationController
  def index
    if params[:search]
      @movies = Movie.search(movie_params[:query]).order("created_at DESC")
    else
      redirect_to(lists_path, status: :not_found)
    end
  end

  protected

  def movie_params
    params.require(:search).permit(%i[query])
  end
end
