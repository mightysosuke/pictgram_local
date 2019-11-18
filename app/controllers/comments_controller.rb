class CommentsController < ApplicationController
  def index
    # @topics = current_user.comment_topics
    @topic = Topic.find_by(id: params[:topic_id])
  end

  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:topic_id]
    comment.comment_content = params[:comment_content]

    redirect_to topics_path
  end
end
