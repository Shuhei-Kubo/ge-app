class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_post, only: [:edit, :show]


  def index
    @posts = Post.all.order(created_at: :desc)
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

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
   
  end 

  def destroy
    post = Post.find(params[:id])
    post.destroy
  
  end

  def edit
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

  def set_post
    @post = Post.find(params[:id])
  end



  private
  def post_params
    params.require(:post).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
