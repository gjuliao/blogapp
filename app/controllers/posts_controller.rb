class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = ApplicationController.current_user
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = ApplicationController.current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to user_posts_path(ApplicationController.current_user)
    else
      flash[:error] = 'Error: Post could not be saved'
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
