ActiveAdmin.register User do

  controller do
    def destroy
      @user = User.find_by_id(params[:id])
      if @user != current_user
        @user.discard
        redirect_to admin_users_path
      end
    end
  end

  permit_params :email, :name, :password, :password_confirmation, :superadmin

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :superadmin
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :name
  filter :superadmin
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
      f.input :superadmin, :label => "Super Administrator"
    end
    f.actions
  end
end