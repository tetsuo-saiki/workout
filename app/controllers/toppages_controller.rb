class ToppagesController < ApplicationController
  def index
    if user_signed_in?
      @post = current_user.posts.build
      @posts = Post.page(params[:page]).per(10).order('created_at desc')
    end
  end

  def show
  end
end
