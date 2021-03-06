class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.create(post_id: params[:post_id])
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
    # redirect_back(fallback_location: root_path)
  end

  # def test
  #   puts (ENV.fetch('GOOGLE_API_CREDS'))
  # end 
  # helper_method :test
  
end
