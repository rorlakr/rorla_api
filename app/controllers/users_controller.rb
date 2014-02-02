class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:create]
  before_action :set_user, except: [:index, :create]

  def index
    if params[:letter]
      @users = User.by_letter(params[:letter])
    else
      @users = User.all
    end
    render json: @users.order(:name)
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: user
    else
      render json: @user.errors, status: :bad_request
    end
  end

  def update
    @user.update(user_params)
    render json: @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
