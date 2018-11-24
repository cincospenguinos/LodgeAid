class CreateUserAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_accounts do |t|
      t.string :username
      t.string :password_digest
      t.integer :permissions
      t.integer :mason_id

      t.timestamps
    end
  end
end
