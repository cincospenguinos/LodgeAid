class CreateMasons < ActiveRecord::Migration[5.1]
  def change
    create_table :masons do |t|
      t.string :first_name
      t.string :last_name
      t.integer :degree
      t.integer :officer_position
      t.string :email_address
      t.string :phone_number

      t.timestamps
    end
  end
end
