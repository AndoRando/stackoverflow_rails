class QuestionsController < ApplicationController
  before_action :find_question, except: [:new, :create, :index]

  def index
    @questions = Question.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      flash[:success] = "You asked a question! Nice."
      redirect_to question_path(@question)
    else
      flash[:danger] = "Looks like there was an error. Try again."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @question.update(question_params)
      flash[:success] = "Question updated! Nice."
      redirect_to question_path(@question)
    else
      flash[:danger] = "Looks like there was an error. Try again."
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

private

  def question_params
    params.require(:question).permit(:body, :title)
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
