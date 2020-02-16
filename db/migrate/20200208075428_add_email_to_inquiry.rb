class AddEmailToInquiry < ActiveRecord::Migration[5.0]
  def change
    add_column :inquiries, :email, :string
  end
end
