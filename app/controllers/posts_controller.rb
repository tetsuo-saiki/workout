class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]
  before_action :set_post, only: [:show]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = '正常に投稿しました。'
      redirect_to root_url
    else
      @user = current_user
      @posts = Post.page(params[:page]).per(5).order('created_at desc')
      flash.now[:alert] = '投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def show
    @user = current_user
    @comment = @post.comments.build
    @comments = @post.comments.page(params[:page]).per(5).order('created_at desc')
  end

  def destroy
    @post.destroy
    flash[:notice] = '投稿を削除しました。'
    redirect_to root_url
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:post, :image)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
