class RenameProfileImageIdColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :profile_image_id, :user_id
  end
end
