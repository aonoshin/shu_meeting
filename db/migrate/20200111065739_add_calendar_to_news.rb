class AddCalendarToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :calendar, :datetime
  end
end
