class AddUserReferenceToComment < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :user, null: false, default: 1, foreign_key: true
  end
end
