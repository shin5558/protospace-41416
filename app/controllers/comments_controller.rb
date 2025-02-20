class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params) 
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      Rails.logger.debug @comment.errors.full_messages # エラー内容をログ出力
      redirect_to prototype_path(@comment.prototype)
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
