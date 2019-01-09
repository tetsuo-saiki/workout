class ToppagesController < ApplicationController
  def index
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts.page(params[:page]).per(5).order('created_at desc')
      @posts_count = @tag.posts.count
    else
      @posts = Post.page(params[:page]).per(5).order('created_at desc')
    end
    @tags = Tag.all
    if user_signed_in?
      @user = current_user
      @post = current_user.posts.build
    end
  end

  def show
    @user = current_user
    @post = current_user.posts.page(params[:page]).per(5).order('created_at desc')
  end
end
