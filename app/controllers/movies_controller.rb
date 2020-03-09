class MoviesController < ApplicationController

  def index
    @movies = Movie.select("title",'url')
  end

end
