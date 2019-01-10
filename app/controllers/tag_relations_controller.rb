class TagRelationsController < ApplicationController
  before_action :set_post_tag_relatinos, only: [:create, :destroy]

  def new
    @post = Post.find(params[:id])
    unless current_user == @post.user
      redirect_to root_url
    end
    @user = current_user
    @default_tags = Tag.all.order('created_at asc').limit(15)
    @user_tags = Tag.where(user_id: current_user.id).order('created_at desc')
  end

  def create
    @post.add_tag(@tag)
    flash[:notice] = '投稿にタグ付けしました'
    redirect_to new_tag_relation_path(id: @post.id)
  end

  def destroy
    @post.detach_tag(@tag)
    flash[:success] = '投稿からタグを外しました'
    redirect_to new_tag_relation_path(id: @post.id)
  end

  private 

  def set_post_tag_relatinos
    @tag = Tag.find(params[:tag_id])
    @post = Post.find(params[:post_id])
  end
end