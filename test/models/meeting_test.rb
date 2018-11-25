# == Schema Information
#
# Table name: meetings
#
#  id            :integer          not null, primary key
#  meeting_type  :integer
#  date_occurred :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  name          :string
#

require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  test 'meetings must have names' do
  	assert_raises(Exception) { Meeting.create!(meeting_type: :business, date_occurred: DateTime.now) }
  end
end
