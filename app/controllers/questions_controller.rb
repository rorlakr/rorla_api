class QuestionsController < ApplicationController
  # 임시 테스트용
  skip_before_filter :authenticate_user!

  before_action :set_question, only: [:show, :update, :destroy]

  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

end