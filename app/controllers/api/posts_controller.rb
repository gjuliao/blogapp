class Api::PostsController < Api::ApplicationController

  def index
    @posts = Post.where(author_id: params[:user_id])
    if @posts
      render json: @posts
    else
      render json: { status: 'Error', error: 'User has no posts' }
    end
  end

  def show
    @post = Post.where(id: params[:id])
    render json: @post
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
