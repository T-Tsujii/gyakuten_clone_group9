class SolutionsController < ApplicationController
  
  def create
   @question = Question.find(params[:question_id])
   @solution = @question.solutions.create!(solution_params)
   redirect_to question_path
  end

  private

  def solution_params
      params.require(:solution).permit(:content)
  end  
end