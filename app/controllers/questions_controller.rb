class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @question = Question.new
  end

  def create
    Question.create(question_params)
  end

  private
    def question_params
      params.require(:question).permit(:title, :detail)
    end

end
