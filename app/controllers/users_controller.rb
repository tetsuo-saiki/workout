class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.page(params[:page]).per(5).order('created_at desc')
    @user_likes = @user.likes.page(params[:page]).per(5).order('created_at desc')
    @followings = @user.followings.page(params[:page]).per(5).order('created_at desc')
    @followings_count = @user.followings.count
    @followers = @user.followers.page(params[:page]).per(5).order('created_at desc')
    @followers_count = @user.followers.count
  end
end
