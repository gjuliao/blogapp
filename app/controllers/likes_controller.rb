class LikesController < ApplicationController

  def create
    @like = Like.new(like_params)
    @like.author = ApplicationController.current_user
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
    params.permit(:author_id, :post_id)
  end
end
