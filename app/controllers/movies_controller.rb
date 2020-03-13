class MoviesController < ApplicationController
  def index
    @movies = Movie.page(params[:page]).per(10)
  end
end
