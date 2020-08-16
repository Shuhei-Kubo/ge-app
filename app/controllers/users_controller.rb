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

  def show
    #@user = User.find(params[:id])
    @nickname = current_user.nickname
    @posts = current_user.posts
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile_image, :profile_text)
  end
end
