class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def create
    Question.create(question_params)
  end

  def new
    @question = Question.new
  end

  private
    def question_params
      params.require(:questions).permit(:question, :detail)
    end

end
