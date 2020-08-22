class RenameUserColumnToComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :user, :user_id
  end
end
