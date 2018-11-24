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

class UserAccount < ApplicationRecord
  has_secure_password
  enum permissions: [ :user, :admin ]

  belongs_to :mason

  validates_presence_of :username, :password_digest

  after_initialize :set_defaults

  def set_defaults
    self.permissions ||= :user
  end  
end
