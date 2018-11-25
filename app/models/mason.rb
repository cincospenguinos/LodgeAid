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

  before_save :validate_positions, unless: :check_nil_values
  before_save :set_defaults

  ## Sets default values
  def set_defaults
    self.degree ||= :master_mason
    self.officer_position ||= :no_position
  end

  ## Returns true if the mason is an officer
  def is_officer?
    self.officer_position.to_sym != :no_position
  end

  ## Returns true if the mason is in proper standing to be an officer
  def can_be_officer?
    self.degree.to_sym == :master_mason
  end

  private

  ## Validates the positions of the current mason
  def validate_positions
    raise RuntimeError, 'Only Master Masons may be officers' if self.is_officer? && !self.can_be_officer?
  end

  def check_nil_values
    self.degree.nil?
  end
end
