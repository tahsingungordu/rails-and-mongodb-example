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
      redirect_to posts_path, notice: "The post has been created!" and return
    end

    render 'new'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to posts_path, notice: "#{@post.title} has been updated!" and return
    end

    render 'edit'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path, notice: "#{@post.title} has been deleted!" and return
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :content_text)
  end
end
