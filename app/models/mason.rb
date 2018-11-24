# == Schema Information
#
# Table name: masons
#
#  id               :integer          not null, primary key
#  first_name       :string
#  last_name        :string
#  degree           :integer
#  officer_position :integer
#  email_address    :string
#  phone_number     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Mason < ApplicationRecord
  enum degree: [ :entered_apprentice, :fellowcraft, :master_mason ]
  enum officer_position: [ :no_position, :mashal, :chaplain, :tyler, :junior_steward, 
    :senior_steward, :junior_deacon, :senior_deacon, :treasurer, :secretary, 
    :junior_warden, :senior_warden, :worshipful_master ]

  has_one :user_account
  has_and_belongs_to_many :meetings

  validates_presence_of :first_name, :last_name

  after_initialize :set_defaults

  def set_defaults
    self.degree ||= :master_mason
    self.officer_position ||= :no_position
  end
end
