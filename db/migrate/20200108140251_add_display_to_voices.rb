class AddDisplayToVoices < ActiveRecord::Migration[5.0]
  def change
    add_column :voices, :display, :string
  end
end
