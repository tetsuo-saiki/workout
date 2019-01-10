class TagsController < ApplicationController
  before_action :set_tag

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = 'タグを作成しました。'
      redirect_to new_tag_path
    else
      @tag = Tag.new
      flash.now[:alert] = 'タグの作成に失敗しました。タグは10文字以内で作成してください。'
      render 'tags/new'
    end
  end

  def destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:tag, :user_id)
  end

  def set_tag
    @user = current_user
    @default_tags = Tag.all.order('created_at asc').limit(15)
    @user_tags = Tag.where(user_id: current_user.id).page(params[:page]).per(10).order('created_at desc')
  end
end
