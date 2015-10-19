class AnswersController < ApplicationController
  before_action :find_question, only: [:new, :create, :edit, :update, :destroy]
  def index
  end

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user
    if @answer.save
      flash[:success] = "You answered a question. Cool."
      redirect_to question_path(@answer.question)
    else
      flash[:danger] = "Something went wrong :/ Try again."
      render :new
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:success] = "You edited your answer."
      redirect_to question_path(@answer.question)
    else
      flash[:danger] = "Something went wrong :/ Try again."
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end

private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end
end
