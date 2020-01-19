class RemoveStatusFromVoices < ActiveRecord::Migration[5.0]
  def change
    remove_column :voices, :status, :integer
  end
end
