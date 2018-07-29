class RenameColumnInFollowship < ActiveRecord::Migration[5.2]
  def change
    rename_column :followships, :following_user_id, :following_id 
  end
end
