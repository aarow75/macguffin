class RatingsController < ApplicationController
  def create
      @movie = Movie.find(params[:movie_id])
      @rating = @movie.ratings.create(params[:rating])
      redirect_to movie_path(@movie)
  end
  def destroy
    @movie = Movie.find(params[:movie_id])
    @rating = @movie.ratings.find(params[:id])
    @rating.destroy
    redirect_to movie_path(@movie)    
  end
  
end
