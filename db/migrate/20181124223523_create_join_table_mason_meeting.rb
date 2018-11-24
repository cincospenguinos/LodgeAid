class CreateJoinTableMasonMeeting < ActiveRecord::Migration[5.1]
  def change
    create_join_table :Masons, :Meetings do |t|
      # t.index [:mason_id, :meeting_id]
      # t.index [:meeting_id, :mason_id]
    end
  end
end
