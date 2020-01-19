class AddReleaseToVoices < ActiveRecord::Migration[5.0]
  def change
    add_column :voices, :release, :string
  end
end
