class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params["post"].permit(:title, :description, :picture))
    if @post.save!
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update(params["post"].permit(:title, :description, :picture))
      redirect_to '/posts'
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Deleted successfully'
    redirect_to '/posts'
  end

end
