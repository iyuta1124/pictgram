class CommentsController < ApplicationController

  def new
    @comment=Comment.new
  end
  
  def create
    @comment=current_user.comments.new(comment_params)
    
    if @comment.save 
      redirect_to topics_path, success: 'コメントの投稿に成功しました。'
    else
      flash.now[:danger]="コメントの投稿に失敗しました。"
      render :new
    end
  end
  
  private
  
    def comment_params
      params.require(:comment).permit(:user_id, :topic_id, :content)
    end
end