class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, :notice => 'Post saved!'
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
    render 'new'
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, :notice => 'Post saved!'
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    redirect_to posts_path, :notice => 'Post deleted!'
  end

  private

    def post_params
      params.require(:post).permit(:title, :markdown)
    end

end
