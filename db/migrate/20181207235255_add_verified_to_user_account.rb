class AddVerifiedToUserAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :user_accounts, :verified, :boolean
  end
end
