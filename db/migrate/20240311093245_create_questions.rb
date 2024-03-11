class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.text :content
      t.text :options
      t.integer :correct_option

      t.timestamps
    end
  end
end
