class AddContentToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :content, :string
  end
end
