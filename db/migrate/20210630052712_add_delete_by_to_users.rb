class AddDeleteByToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :deleted_by
  end
end
