class AddReleaseToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :release, :string
  end
end
