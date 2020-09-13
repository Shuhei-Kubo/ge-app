class LikesController < ApplicationController

  def create
    puts JSON.parse(ENV.fetch('GOOGLE_API_CREDS'))
    @post = Post.find(params[:post_id])
    @like = current_user.likes.create(post_id: params[:post_id])
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
    # redirect_back(fallback_location: root_path)
  end
  
end
