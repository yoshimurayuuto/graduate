class CommentsController < ApplicationController
  def create
    @share = Share.find(params[:share_id])
    @comment = @share.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to share_path(@share) }
      else
        format.html { redirect_to share_path(@share), notice: '投稿できませんでした...' }
      end
    end
  end

  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:share_id, :content)
  end

  end