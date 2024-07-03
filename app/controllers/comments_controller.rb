class CommentsController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @comment = @board.comments.build(comment_params)
    if @comment.save
      redirect_to @board, notice: 'コメントが追加されました。'
    else
      redirect_to @board, alert: 'コメントの追加に失敗しました。'
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @comment = @board.comments.find(params[:id])
    @comment.destroy
    redirect_to @board, notice: 'コメントが削除されました。'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
