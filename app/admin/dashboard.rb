# app/admin/dashboard.rb
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # Here is an example of a simple dashboard with columns and panels.
    columns do
      panel "Info" do
        para "Welcome to ActiveAdmin."
      end
      column do
        panel "Recent Users" do
          ul do
            User.last(5).reverse.map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
        panel "Recent Blogs" do
          ul do
            Blog.last(5).reverse.map do |blog|
              li link_to(blog.title, admin_blog_path(blog))
            end
          end
        end
      end

      column do
        panel "Recent Comments" do
          ul do
            Comment.last(5).reverse.map do |comment|
              li link_to(comment.content, admin_comment_path(comment))
            end
          end
        end
      end
    end
  end
end
