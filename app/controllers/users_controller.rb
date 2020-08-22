class UsersController < ApplicationController
  def edit

  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit 
    end
  end

  def create
    post = Post.new(post_params)
    post.save
    redirect_to user_path
  end

  def show
    
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile_image, :profile_text)
  end
end
