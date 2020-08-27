class CommentsController < ApplicationController
  def create
    # @comment = Comment.create(comment_params)
    # @comment.save
    # render :create
    # redirect_to post_path(params[:post_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id 
    @comments = @post.comments.includes(:user).order("created_at DESC")

  if @comment.save
    render :create
  end
    
  end
  


  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comments = @post.comments.includes(:user).order("created_at DESC")
    @comment.destroy
    render :destroy
    
    # comment = Comment.find(params[:id])
    # post = comment.post
    # comment.destroy
    # redirect_to "/posts/#{post.id}"
  end

  

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
