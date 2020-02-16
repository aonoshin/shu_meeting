class AddColumnAnswerAndInquiry < ActiveRecord::Migration[5.0]
  def change
    add_column :inquiries, :user_id, :integer
    add_column :answers, :inquiry_id , :integer
    add_column :answers, :answer , :text
  end
end
