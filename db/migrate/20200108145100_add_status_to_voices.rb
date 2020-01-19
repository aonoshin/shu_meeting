class AddStatusToVoices < ActiveRecord::Migration[5.0]
  def change
    add_column :voices, :status, :integer
  end
end
