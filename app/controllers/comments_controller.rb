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

  def toggle_read
    @comment = @board.comments.find(params[:id])
    @user = User.first # 仮のユーザーを設定（ログイン機能がないため）

    read_status = ReadStatus.find_by(user: @user, comment: @comment)
    if read_status
      read_status.update(read: !read_status.read)
    else
      ReadStatus.create(user: @user, comment: @comment, read: true)
    end

    redirect_to @board
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
