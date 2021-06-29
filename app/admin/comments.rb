ActiveAdmin.register Comment, as: "BlogsComment" do

  controller do
    def destroy
      @comment = Comment.find(params[:id])
      @comment.discard
      redirect_to admin_blogs_comments_path
    end
  end

  permit_params :content, :blog_id, :user_id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :content, :blog_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:content, :blog_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
