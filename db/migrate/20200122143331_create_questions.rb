class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      
      t.text :qcontent
      t.text :acontent
      t.timestamps
    end
  end
end
