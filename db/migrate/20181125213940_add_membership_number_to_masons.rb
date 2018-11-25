class AddMembershipNumberToMasons < ActiveRecord::Migration[5.1]
  def change
    add_column :masons, :membership_number, :string
  end
end
