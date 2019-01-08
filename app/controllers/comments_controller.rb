class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]
  # before_action :set_comment, only: [:edit]

  def create
    @comment = Comment.new
    @post_id = params[:comment][:post_id]
    @comment.comment = params[:comment][:comment]
    @comment.post = Post.find_by(id: @post_id)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = 'コメントを投稿しました。'
      redirect_to post_path(@post_id)
    else
      @user = current_user
      @post = Post.find_by(id: @post_id)
      @comment = @post.comments.build
      @comments = @post.comments.page(params[:page]).per(5).order('created_at asc')
      flash[:alert] = "投稿に失敗しました。\nコメントは1文字以上500文字以下で投稿してください。"
      redirect_to post_path(@post_id)
    end
  end

  # def edit
  #   @user = current_user
  # end

  def destroy
    @comment.destroy
    flash[:notice] = '投稿を削除しました。'
    redirect_to post_path(@post)
  end

  private

  # def set_comment
  #   @comment = Comment.find(params[:id])
  # end

  def correct_user
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to post_path(@post)
    end
  end
end
