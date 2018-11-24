class CreateMeetings < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings do |t|
      t.integer :meeting_type
      t.datetime :date_occurred

      t.timestamps
    end
  end
end
