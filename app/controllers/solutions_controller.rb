class SolutionsController < ApplicationController
  
  def create 
   @solution = 
   @question.solutions.build(~~~)
  end
end