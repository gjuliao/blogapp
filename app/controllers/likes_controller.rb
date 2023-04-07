class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @like.author = ApplicationController.current_user
    @like.post = @user.posts.find(params['post_id'])
    if @like.save
      flash[:success] = 'Like created successfully'
      redirect_to user_posts_path(ApplicationController.current_user, @post)
    else
      flash[:error] = 'Error: Like could not be saved'
      render 'new'
    end
  end

  private

  def like_params
    params.require(:like)
  end
end
