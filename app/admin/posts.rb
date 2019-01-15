ActiveAdmin.register Post do
  actions :all, :except => [:new, :create, :update, :edit] # 管理者が勝手にユーザに紐づけた投稿をできないようにするため
#   actions :index, :show, :destroy # こちらでも同様
  permit_params :post, :image, :user
  
  index do
    selectable_column
    id_column
    column :post
    column :image
    column :user
    column :created_at
    actions
  end
  
  filter :post
  filter :image
  filter :user
  filter :created_at
  
  form do |f|
    f.inputs do
      f.input :post
      f.input :image
      f.input :user
    end
    f.actions
  end
end