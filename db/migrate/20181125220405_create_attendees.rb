class CreateAttendees < ActiveRecord::Migration[5.1]
  def change
    create_table :attendees do |t|
      t.references :mason, foreign_key: true
      t.references :meeting, foreign_key: true

      t.timestamps
    end
  end
end
