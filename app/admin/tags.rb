ActiveAdmin.register Tag do
  permit_params :tag, :user_id
  
  index do
    selectable_column
    id_column
    column :tag
    column :user_id
    column :created_at
    actions
  end
  
  filter :tag
  filter :user_id
  filter :created_at
  
  form do |f|
    f.inputs do
      f.input :tag
      f.input :user_id
    end
    f.actions
  end
end