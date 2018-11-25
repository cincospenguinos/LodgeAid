# == Schema Information
#
# Table name: attendees
#
#  id         :integer          not null, primary key
#  mason_id   :integer
#  meeting_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_attendees_on_mason_id    (mason_id)
#  index_attendees_on_meeting_id  (meeting_id)
#

class Attendee < ApplicationRecord
  belongs_to :mason
  belongs_to :meeting
end
