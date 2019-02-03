class LikeRelationsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def show
  end

  def create
    current_user.add_like(@post)
    flash[:notice] = '投稿をお気に入りに追加しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.detach_like(@post)
    flash[:notice] = '投稿をお気に入りから外しました'
    redirect_back(fallback_location: root_path)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
