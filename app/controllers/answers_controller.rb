class AnswersController < ApplicationController

  def index
    @answers = Answer.where(question_id: params[:question_id])
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end


  def create
    binding.pry
    @answer = Answer.new(description: params[:answer][:description], user_id: current_user.id, question_id: params[:question_id])
    if @answer.save
      flash[:notice] = 'Answer added.'
      redirect_to questions_path + "/" + params[:question_id]
    else
      render :new
    end
  end



end
