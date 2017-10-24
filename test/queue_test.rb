require "minitest/autorun"
require "minitest/pride"
require "./lib/queue"

class ListTest < Minitest::Test
  def test_queue_count_in_event
    er = EventReporter.new('./data/full_event_attendees.csv')

    assert_equal 0, er.queue_count
  end

end
