class CommentsController < ApplicationController

  before_action :set_post!, only: %i[edit create update]
  before_action :set_comment!, only: %i[edit update]

  def edit
    @comment = PostComment.find(params[:id])
  end

  def destroy
    comment = PostComment.find(params[:id])
    comment.destroy
    redirect_to post_path(comment.post_id)
      flash[:success] = 'comment executed'
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      flash[:success] = 'cant be blank?'
      render 'edit'
    end
  end

  def create
    @comment = @post.post_comments.build(comment_params)

    if @comment.save
      flash[:success] = 'comment done'
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:body)
  end

  def set_comment!
    @comment = PostComment.find(params[:id])
  end

  def set_post!
    @post = Post.find(params[:post_id])
  end

  # Only allow a list of trusted parameters through.
  # def comment_params
  #   params.permit(:post_comment, :post_id)
  # end
end
