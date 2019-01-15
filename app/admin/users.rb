ActiveAdmin.register User do
    actions :index, :show, :destroy
    permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :failed_attempts, :unlock_token, :locked_at, :sex, :birth_day, :profile, :bench_press_max, :squat_max, :deadlift_max, :provider, :uid, :username, :created_at, :updated_at, :image
  
    index do
      selectable_column
      id_column
      column :email
      column :encrypted_password
      column :reset_password_token
      column :reset_password_sent_at
      column :remember_created_at
      column :sign_in_count
      column :current_sign_in_at
      column :last_sign_in_at
      column :current_sign_in_ip
      column :last_sign_in_ip
      column :confirmation_token
      column :confirmed_at
      column :confirmation_sent_at
      column :unconfirmed_email
      column :failed_attempts
      column :unlock_token
      column :locked_at
      column :sex
      column :birth_day
      column :profile
      column :bench_press_max
      column :squat_max
      column :deadlift_max
      column :provider
      column :uid
      column :username
      column :created_at
      column :updated_at
      column :image
      actions
    end
    
    filter :email
    filter :encrypted_password
    filter :reset_password_token
    filter :reset_password_sent_at
    filter :remember_created_at
    filter :sign_in_count
    filter :current_sign_in_at
    filter :last_sign_in_at
    filter :current_sign_in_ip
    filter :last_sign_in_ip
    filter :confirmation_token
    filter :confirmed_at
    filter :confirmation_sent_at
    filter :unconfirmed_email
    filter :failed_attempts
    filter :unlock_token
    filter :locked_at
    filter :sex
    filter :birth_day
    filter :profile
    filter :bench_press_max
    filter :squat_max
    filter :deadlift_max
    filter :provider
    filter :uid
    filter :username
    filter :created_at
    filter :updated_at
    filter :image
    
    form do |f|
      f.inputs do
        f.input :email
        f.input :encrypted_password
        f.input :reset_password_token
        f.input :reset_password_sent_at
        f.input :remember_created_at
        f.input :sign_in_count
        f.input :current_sign_in_at
        f.input :last_sign_in_at
        f.input :current_sign_in_ip
        f.input :last_sign_in_ip
        f.input :confirmation_token
        f.input :confirmed_at
        f.input :confirmation_sent_at
        f.input :unconfirmed_email
        f.input :failed_attempts
        f.input :unlock_token
        f.input :locked_at
        f.input :sex
        f.input :birth_day
        f.input :profile
        f.input :bench_press_max
        f.input :squat_max
        f.input :deadlift_max
        f.input :provider
        f.input :uid
        f.input :username
        f.input :created_at
        f.input :updated_at
        f.input :image
      end
      f.actions
    end
end
