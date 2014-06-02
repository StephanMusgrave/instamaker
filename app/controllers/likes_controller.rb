class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    Like.create(user: @user, post: @post)
    redirect_to('/posts')
  end

end
