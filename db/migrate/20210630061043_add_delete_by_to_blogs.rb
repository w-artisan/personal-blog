class AddDeleteByToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :blogs, :deleted_by
  end
end
