class AddColumnTouser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :area, :string
    add_column :users, :hobby, :string
    add_column :users, :icon, :string
    add_column :users, :profile, :text
  end
end
