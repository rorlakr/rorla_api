class CommentsController < ApplicationController

  skip_before_filter :authenticate_user!

  before_action :set_post
  before_action :set_comment, only: [:show, :update, :destroy]

  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    render json: @comment
  end

  def create
    @comment = @post.comments.create(comment_params)
    render json: @comment

  end

  def update
    @comment.update(comment_params)
    render json: @comment
  end

  def destroy
    @comment.destroy
    render json: { message: "destoryed" }
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

end
