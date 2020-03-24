class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def create
    Question.new(question_params)
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end
  private
    def question_params
      params.require(:questions).permit(:question,:detail)
    end

end
