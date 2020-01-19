class CreateHomes < ActiveRecord::Migration[5.0]
  def change
    create_table :homes do |t|
      
      t.string :name
      t.integer :age
      t.string :area
      t.string :image
      t.text :content
      t.timestamps
    end
  end
end
