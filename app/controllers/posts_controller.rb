class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = '正常に投稿しました。'
      redirect_to root_url
    else
      @posts = current_user.posts.order('create_at desc').page(params[:page])
      flash.now[:alert] = '投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = '投稿を削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

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
