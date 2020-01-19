class RemoveFollowingIdFromFriends < ActiveRecord::Migration[5.0]
  def change
    remove_column :friends, :following_id, :integer
  end
end
