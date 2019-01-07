class ToppagesController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(5).order('created_at desc')
    if user_signed_in?
      @post = current_user.posts.build
    end
  end

  def show
  end
end
