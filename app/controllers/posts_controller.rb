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
    @post.user = current_user
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
    if @post.user == current_user
      @post.destroy
      flash[:notice] = 'Deleted successfully'
    end
    redirect_to '/posts'
  end

end
