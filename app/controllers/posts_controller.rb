class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def new
    @post = Post.new
  end

  def create
    new_post = params.require(:post).permit(:description)
    post = Post.create(new_post)
    redirect_to "/posts/#{post.id}"
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @posts = Post.all
    @comments = Comment.all
  end

  def show
    id = params[:id]
    @post = Post.find(id)
    @comments = Comment.where(["post_id = ?", id]).all
  end

  def post_params
    params.require(:post).permit(:description)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
end
