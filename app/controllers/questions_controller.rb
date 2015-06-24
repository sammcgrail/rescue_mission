class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def update
    @question = find_question
    @answers = Answer.where(question_id: @question)
    @answer = Answer.new
    if @question.update(title: params[:question][:title], body: params[:question][:body])
      flash[:notice] = 'Question Updated'
      render :show
    else
      render :edit
    end
  end

  def edit
    @question = find_question
  end
  def show
    @question = find_question
    @answers = Answer.where(question_id: @question)
    @answer = Answer.new
  end

  def destroy
    @question = find_question
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

  def find_question
    Question.find(params[:id])
  end

  protected

  def question_params
    params.require(:question).permit(:title, :body, :user_id, :timestamps)
  end
end
