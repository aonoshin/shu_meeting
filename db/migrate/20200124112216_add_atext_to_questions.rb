class AddAtextToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :atext, :text
  end
end
