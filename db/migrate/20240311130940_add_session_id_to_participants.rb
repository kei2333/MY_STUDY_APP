class AddSessionIdToParticipants < ActiveRecord::Migration[7.1]
  def change
    add_column :participants, :session_id, :string
  end
end
