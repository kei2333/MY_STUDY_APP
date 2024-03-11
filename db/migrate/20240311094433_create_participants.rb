class CreateParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :participants do |t|
      t.integer :score
      t.float :total_avg
      t.string :label
      t.string :group

      t.timestamps
    end
  end
end
