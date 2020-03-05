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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update(question_params)
  end

  def destroy
    question = Question.find(params[:id])
    question.delete
  end

  private
    def question_params
      params.require(:questions).permit(:question,:detail)
    end

end
