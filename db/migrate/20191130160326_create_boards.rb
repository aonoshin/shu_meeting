class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.text :content
      t.string :image
      t.string :place
      t.date :day
      t.time :times
      t.integer :user_id

      t.timestamps
    end
  end
end
