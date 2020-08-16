class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new  
  end

  def create
     post = Post.create(post_params)
     if post.save
      redirect_to root_path
     end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    post = Post.find(params[:id])
    post.update(post_params)
    if post.save
      redirect_to root_path
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
