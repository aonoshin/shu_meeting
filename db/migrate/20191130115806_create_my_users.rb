class CreateMyUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :my_users do |t|
      t.string :name
      t.integer :age
      t.string :area
      t.string :gender
      t.string :profile
      t.string :hobby
      t.string :icon
      t.string :albums
      t.timestamps
    end
  end
end
