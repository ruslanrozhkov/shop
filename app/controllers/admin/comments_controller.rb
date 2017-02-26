class Admin::CommentsController < AdminController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @comments = Comment.all.order(id: :desc)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to admin_comments_path, notice: 'Комментарий успешно обновлен' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
      format.html { redirect_to admin_comments_path, notice: 'Комментарий удален!' }
      else
      format.html { redirect_to admin_comments_path, notice: 'Невозможно удалить комментарий' }
      end
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:id, :email, :name, :message)
  end
end
