class TextsController < ApplicationController

  def index
    @texts = Text.all
  end

  def show
    @texts = Text.find(params[:id])
  end
end
