class RemoveMasonsMeetings < ActiveRecord::Migration[5.1]
  def change
  	drop_table :masons_meetings
  end
end
