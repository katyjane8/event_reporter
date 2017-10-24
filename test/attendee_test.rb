require "minitest/autorun"
require "minitest/pride"
require "./lib/attendee"

class AttendeeReporterTest < Minitest::Test
  def test_attendees_file_returns_first_name
    skip
    atten = Attendee.new(row)

    assert_equal "Nate", atten.first_name
  end

end
