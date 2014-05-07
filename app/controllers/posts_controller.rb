class PostsController < ApplicationController
 
  skip_before_filter :authenticate_user!

  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    @post = Post.create(post_params)
    render json: @post
  end

  def update
    @post.update(post_params)
    render json: @post
  end

  def destroy
    @post.destroy
    render json: { message: "destroyed" }
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end

end
