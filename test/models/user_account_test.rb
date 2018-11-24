# == Schema Information
#
# Table name: user_accounts
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  permissions     :integer
#  mason_id        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserAccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
