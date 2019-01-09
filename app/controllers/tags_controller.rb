class TagsController < ApplicationController
  def new
    if user_signed_in?
      @user = current_user
      @default_tags = Tag.all.order('created_at asc').limit(15)
      @user_tags = Tag.where('user_id', current_user.id).page(params[:page]).per(5).order('created_at desc')
      @tag = Tag.new
    end
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = 'タグを作成しました。'
      redirect_to new_tag_path
    else
      @user = current_user
      @default_tags = Tag.all.order('created_at asc').limit(15)
      @user_tags = Tag.where('user_id', current_user.id).page(params[:page]).per(5).order('created_at desc')
      @tag = Tag.new
      flash.now[:alert] = 'タグの作成に失敗しました。'
      render 'tags/new'
    end
  end

  def destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:tag, :user_id)
  end
end
