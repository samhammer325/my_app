class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path #redirect to posts if post created
    else
      render :new # otherwise redirects to form
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update 
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :author, :body)
  end

end
