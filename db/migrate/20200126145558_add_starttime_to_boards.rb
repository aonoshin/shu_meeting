class AddStarttimeToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :starttime, :time
  end
end
