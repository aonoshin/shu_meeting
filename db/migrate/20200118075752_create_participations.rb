class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.integer :board_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
