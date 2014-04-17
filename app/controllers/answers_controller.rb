class AnswersController < ApplicationController
  # 임시 테스트용
  skip_before_filter :authenticate_user!

  before_action :set_answer, only: [:show, :update, :destroy]

  def index
    @answers = Answer.all
    render json: @answers
  end

  def show
    render json: @answer
  end

  def create
    @answer = Answer.create(answer_params)
    render json: @answer
  end

  def update
    @answer.update(answer_params)
    render json: @answer
  end

  def destroy
    @answer.destroy
    render json: { message: "destroyed" }
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:title, :content)
    end
end