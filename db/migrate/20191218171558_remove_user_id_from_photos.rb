class RemoveUserIdFromPhotos < ActiveRecord::Migration[5.0]
  def change
    remove_column :photos, :user_id, :string
  end
end
