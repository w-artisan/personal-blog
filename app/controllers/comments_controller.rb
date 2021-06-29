class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    comment = current_user.comments.new(content: params[:newComment], blog_id: params[:blog_id])

    if comment.save
      render json: { comment: comment }, status: :ok
    else
      render json: { error: comment.errors.message }, status: 422
    end
  end

  def destroy
    if @comment.discard
      head :no_content
    else
      render json: { error: @comment.errors.message }, status: 422
    end
  end

  private

  def set_comment
    @comment = Comment.kept.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :blog_id)
  end
end
