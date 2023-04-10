class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author = ApplicationController.current_user
    @comment.post = @user.posts.find(params['post_id'])

    if @comment.save
      flash[:success] = 'Comment created successfully'
      redirect_to user_posts_path(ApplicationController.current_user, @post)
    else
      flash[:error] = 'Error: Comment could not be saved'
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
