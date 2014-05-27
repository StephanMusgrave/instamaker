class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params["post"].permit(:title, :description))
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def edit
    p "hiiiiiii"
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update(params["post"].permit(:title, :description))
      redirect_to '/posts'
    else
      render 'edit'
    end
  end

end
