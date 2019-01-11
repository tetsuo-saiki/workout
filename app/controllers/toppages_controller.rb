class ToppagesController < ApplicationController
  def index
    if params[:search]
      @search_word = params[:search]
      @searched_posts = Post.where('post like ?', "%#{@search_word}%")
      @posts = @searched_posts.page(params[:page]).per(5).order('created_at desc')
      @searched_posts_count = @searched_posts.count
    elsif params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts.page(params[:page]).per(5).order('created_at desc')
      @tag_posts_count = @tag.posts.count
    else
      @posts = Post.page(params[:page]).per(5).order('created_at desc')
    end
    @default_tags = Tag.all.order('created_at asc').limit(15)
    if user_signed_in?
      @user = current_user
      @post = current_user.posts.build
      @user_tags = Tag.where(user_id: current_user.id).order('created_at desc')
    end
  end
end
