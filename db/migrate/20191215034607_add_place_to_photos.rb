class AddPlaceToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :place, :string
  end
end
