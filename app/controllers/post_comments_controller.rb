class PostCommentsController < ApplicationController
  
  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.save
    redirect_to post_image_path
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
    
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
