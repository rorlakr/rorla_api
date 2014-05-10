class AnswersController < ApplicationController
  before_action :set_question
  before_action :set_answer, only: [:show, :update, :destroy]

  def index
    @answers = @question.answers
    render json: @answers
  end

  def show
    render json: @answer
  end

  def create
    @answer = @question.answers.create(answer_params)
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
    def set_question
      @question = Question.find(params[:question_id])
    end

    def set_answer
      @answer = @question.answers.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:title, :content)
    end
end
