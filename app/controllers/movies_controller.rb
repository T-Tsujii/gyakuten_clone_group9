class MoviesController < ApplicationController

  def index
    @movies = Movie.order(:id)
  end

end
