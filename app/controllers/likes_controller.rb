class LikesController < ApplicationController
  include PostsHelper

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.create(post_id: params[:post_id])
    @test = test
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
    # redirect_back(fallback_location: root_path)
  end

  def test
    puts (ENV.fetch('GOOGLE_API_CREDS'))
  end 
  helper_method :test
  
end
