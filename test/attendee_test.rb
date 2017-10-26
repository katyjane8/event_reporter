require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/attendee'

class AttendeeReporterTest < Minitest::Test
  def test_attendees_file_returns_first_name
    attendee = "3510,1/31/09 14:57,Carolyn,Villafana,cballac2@jumpstartlab.com,908-642-8000,9 booth st.,burlington,VT,5401"
    atten = attendee.split(",")
    zipcode = Cleaner.clean_zipcode(atten[-1])

    assert_equal "05401", zipcode
  end

  def test_it_cleans_up_phone_numbers_with_periods_and_hyphens
    attendee = "3510,1/31/09 14:57,Carolyn,Villafana,cballac2@jumpstartlab.com,908-642-8000,9 booth st.,burlington,VT,5401"
    atten = attendee.split(",")
    phone_number = Cleaner.clean_phone(atten[-5])

    assert_equal "9086428000", phone_number
  end

  def test_it_cleans_up_city_name
    attendee = "3510,1/31/09 14:57,Carolyn,Villafana,cballac2@jumpstartlab.com,908-642-8000,9 booth st.,burlington,VT,5401"
    atten = attendee.split(",")
    city = Cleaner.clean_name(atten[-3])

    assert_equal "Burlington", city
  end

  def test_it_cleans_state_up
    attendee = "40,12/7/08 13:07,Dan,Beneway,uevys@jumpstartlab.com,434.409.6000,3720 Country Ln,Charlottesville,va,22903"
    atten = attendee.split(",")
    state = Cleaner.clean_state(atten[-2])

    assert_equal "VA", state
  end

end
