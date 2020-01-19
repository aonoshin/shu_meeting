class AddNewsToHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :news, :text
  end
end
