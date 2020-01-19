class RemoveDisplayFromVoices < ActiveRecord::Migration[5.0]
  def change
    remove_column :voices, :display, :string
  end
end
