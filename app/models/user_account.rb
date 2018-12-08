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
#  verified        :boolean
#

class UserAccount < ApplicationRecord
  has_secure_password
  enum permissions: [ :user, :admin ]

  belongs_to :mason

  validates_presence_of :username, :password_digest
  validates_uniqueness_of :username

  validates :password, length: { within: 6..28 }

  before_save :set_defaults

  def set_defaults
    self.permissions ||= :user
    self.permissions = :admin if mason_should_be_admin?
    self.verified = false
  end

  def is_admin?
  	self.permissions.to_sym == :admin
  end

  private

  def mason_should_be_admin?
  	[ :worshipful_master, :senior_warden, :junior_warden, :secretary, :tyler ].include?(self.mason.officer_position.to_sym)
  end
end
