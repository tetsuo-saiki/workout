class ToppagesController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(5).order('created_at desc')
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
