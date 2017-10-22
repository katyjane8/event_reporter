require "minitest/autorun"
require "minitest/pride"
require "./lib/attendee"

class AttendeeReporterTest < Minitest::Test
  def test_attendees_file_returns_first_name
    atte = Attendee.new(46)

    assert_equal "Nate", atte.first_name
  end
  
end
