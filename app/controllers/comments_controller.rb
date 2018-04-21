class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    #topic = Topic.find_by(id: params[:topic_id].to_i)
    @comment = Comment.new(topic_id: params[:topic_id].to_i, comment_text: params[:comment][:comment_text])

    #@comment = topic.comments.new(comment_params)

    if @comment.save
      redirect_to topics_path
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text)
  end

end
