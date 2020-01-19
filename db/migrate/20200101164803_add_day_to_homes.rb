class AddDayToHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :day, :integer
  end
end
