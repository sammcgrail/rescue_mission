class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: @question)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(title: question_params[:title], body: question_params[:body], user_id: current_user.id)
    if @question.save
      flash[:notice] = 'Question added.'
      redirect_to questions_path
    else
      render :new
    end

  end



  protected
  def question_params
    params.require(:question).permit(:title, :body, :user_id, :timestamps)
  end
end
