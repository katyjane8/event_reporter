require "minitest/autorun"
require "minitest/pride"
require "./lib/attendee"

class AttendeeReporterTest < Minitest::Test
  def test_attendees_file_returns_first_name
    attendee = "3510,1/31/09 14:57,Carolyn,Villafana,cballac2@jumpstartlab.com,908-642-8000,9 booth st.,burlington,VT,5401"
    atten = attendee.split(",")
    zipcode = Cleaner.clean_zipcode(atten[-1])

    assert_equal "05401", zipcode
  end

end
