class QuestionsController < ApplicationController
  # 임시 테스트용
  skip_before_filter :authenticate_user!

  before_action :set_question, only: [:show, :update, :destroy]

  def index
    @questions = Question.all
    render json: @questions
  end

  def show
    render json: @question
  end

  def create
    @question = Question.create(question_params)
    render json: @question
  end

  def update
  end

  def destroy
    @question.destroy
    render json: { message: "destroyed" }
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :content)
    end
end