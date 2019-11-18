class CommentsController < ApplicationController
  def new
    # @topics = current_user.comment_topics
    @topic = Topic.find_by(id: params[:topic_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to topics_path, success: 'コメントを登録しました'
    else
      redirect_to topics_path, danger: 'コメントの登録に失敗しました'
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:topic_id, :comment_content).merge(user_id: current_user.id)
  end
end
