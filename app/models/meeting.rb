# == Schema Information
#
# Table name: meetings
#
#  id            :integer          not null, primary key
#  meeting_type  :integer
#  date_occurred :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Meeting < ApplicationRecord
  enum meeting_type: [ :business, :degree, :informal ]

  has_and_belongs_to_many :masons

  validates_presence_of :date_occurred, :meeting_type

  ## Alias for masons who attended the meeting
  def attendees
  	self.masons
  end
end
