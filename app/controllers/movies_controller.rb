class MoviesController < ApplicationController
  def index
    if params.key?(:format)
      @movies = Movie.find(params[:format].split('/'))
    else
      @movies = Movie.all
    end
  end

  def search
    @movies = Movie.search(movie_params[:title])

    #unless @movies
    #  @movies = Movie.all
    #end
    redirect_to(movies_path(@movies))
  end

  protected

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(%i[title])
  end
end
