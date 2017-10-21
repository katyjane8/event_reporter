require "minitest/autorun"
require "minitest/pride"
require "./lib/event_reporter"

class EventReporterTest < Minitest::Test
  # A. Happy Paths
  def test_CSV_loads_all_attendees
    er = EventReporter.new('./lib/full_event_attendees.csv')

    assert_equal 5175, er.all_attendees.count
  end

  def test_queue_count_in_event
    er = EventReporter.new('./lib/full_event_attendees.csv')

    assert_equal 0, er.queue_count
  end

  def test_reporter_can_find_all_Johns
    er = EventReporter.new('./lib/full_event_attendees.csv')

    assert_equal "john", er.find_attendees(:first_name, "John")
  end

  def test_reporter_can_store_all_Johns_in_queue
    # queue count should return 63
  end

  def test_queue_can_be_cleared
    # queue clear
  end

  def test_queue_returns_zero_after_cleared
    # queue count should return 0
  end

# help should list the commands
# help queue count should explain the queue count function
# help queue print should explain the printing function
end
