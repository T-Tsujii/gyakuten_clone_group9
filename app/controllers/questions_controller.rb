class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order(created_at: :"DESC")
    @question = Question.new
  end 

  def new
    
  end

  def create

    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "登録完了"
      redirect_to action: 'index'
    else
      flash.now[:alert] = "もう一度やり直してください"
      @questions = Question.all.order(created_at: :"DESC")
      render :index
    end

  end

  def show
    @question = Question.find(params[:id])
    @solutions = Solution.find(params[:question_id])
    @solution = Solution.new
  end

  private
    def question_params
      params.require(:question).permit(:title, :detail)
    end
end
