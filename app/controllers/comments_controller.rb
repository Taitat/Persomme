class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    
    if @comment.save
      redirect_to post_path(id: @comment.post.id, question_id: @comment.post.question.id)
    else
      render post_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to post_path(id: @comment.post.id, question_id: @comment.post.question.id)
  
  end


  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end


end
