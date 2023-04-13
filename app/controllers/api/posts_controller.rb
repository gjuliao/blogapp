class Api::PostsController < Api::ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, :likes)
    if @user
      render json: @posts
    else
      render json: { status: 'Error', error: 'User Not Found' }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
