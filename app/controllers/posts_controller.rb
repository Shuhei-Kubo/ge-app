class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_post, only: [:edit, :show]


  def index
    @posts = Post.all.order(created_at: :desc)
    @like = Like.new

    # @user = User.find(params[:id])
  end

  def new
    @post = Post.new  
  end

  def create
     post = Post.create(post_params)
     if post.save
        redirect_to root_path
     else
        render :create
     
     end
  end

  def search
    redirect_to search_path if params[:keyword] == ""
    @posts = Post.where('title LIKE(?) OR text LIKE(?)', "%#{params[:keyword]}%", "%#{params[:keyword]}%").order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order("created_at DESC")
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

  private
  def post_params
    params.require(:post)
          .permit(:title, :text, :image)
          .merge(user_id: current_user.id)
  end
end

def set_post
  @post = Post.find(params[:id])
end