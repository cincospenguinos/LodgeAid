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

require 'test_helper'

class MasonTest < ActiveSupport::TestCase
  test 'only master masons can hold an officer position' do
    assert_raises(Exception) { Mason.create!(first_name: 'Joe', last_name: 'Guy', degree: :entered_apprentice, 
                                officer_position: :junior_warden) }
    assert_nothing_raised { Mason.create!(first_name: 'Joe', last_name: 'Guy', degree: :master_mason, officer_position: :junior_warden) }
    assert_nothing_raised { Mason.create!(first_name: 'Joe', last_name: 'Guy', officer_position: :junior_warden) } # tests the defaults
  end

  test 'first and last names must be available' do
    assert_raises(Exception) { Mason.create!(first_name: 'Joe') }
    assert_raises(Exception) { Mason.create!(last_name: 'Joe') }
  end
end
