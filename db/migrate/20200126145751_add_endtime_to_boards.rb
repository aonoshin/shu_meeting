class AddEndtimeToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :endtime, :time
  end
end
