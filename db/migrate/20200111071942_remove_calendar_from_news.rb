class RemoveCalendarFromNews < ActiveRecord::Migration[5.0]
  def change
    remove_column :news, :calendar, :datetime
  end
end
