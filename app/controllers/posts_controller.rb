class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params["post"].permit(:title, :description, :picture, :tag_names, :location))
    @post.user = current_user
    @post.save!

    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    flash[:notice] = 'Deleted successfully'
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'This is not your post!'
  ensure
    redirect_to '/posts'
  end

  # def edit
  #   @post = Post.find(params[:id])
  # end

  # def update
  #   @post = Post.find(params[:id])
    
  #   if @post.update(params["post"].permit(:title, :description, :picture, :tag_names, :location))
  #     redirect_to '/posts'
  #   else
  #     render 'edit'
  #   end
  # end

end








































