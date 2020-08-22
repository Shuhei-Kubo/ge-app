class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @comment.save
    redirect_to post_path(params[:post_id])
    
  end
  

  # def create
  #   @comment = Comment.create(comment_params)
  #   if @comment.save
  #     respond_to do |format|
  #     format.html { redirect_to post_path(params[:post_id]) }
  #     format.json
  #   end
      
  #   end
  # end

  

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    
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
