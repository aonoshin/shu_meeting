class AddUserIdToVoices < ActiveRecord::Migration[5.0]
  def change
    add_column :voices, :user_id, :integer
  end
end
