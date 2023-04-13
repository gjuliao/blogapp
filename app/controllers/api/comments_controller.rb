class Api::CommentsController < Api::ApplicationController
  def index
    @comments = Post.find(params[:post_id]).comments
    if @comments
      render json: { status: 'ok', data: @comments }
    else
      render json: { status: 'Error', error: 'No Comments Found' }
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)

    if @user && @post
      if @comment.save
        render json: { status: :created, data: @comment }
      else
        render json: { error: @comment.errors, status: :unprocessable_entity }
      end
    else
      render json: { status: 'Error', error: 'User && Post Not Found' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
