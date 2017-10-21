require "minitest/autorun"
require "minitest/pride"
require "./lib/event_reporter"

class EventReporterTest < Minitest::Test
  # A. Happy Paths
  def test_CSV_loads_all_attendees
    # load full_event_attendees.csv
  end

  def test_queue_count_in_event
    # queue count should return 0
  end

  def test_reporter_can_find_all_Johns
    # find first_name John
  end

  def test_reporter_can_store_all_Johns_in_queue
    # queue count should return 63
  end

  def test_queue_can_be_cleared
    # queue clear
  end
# queue count should return 0
# help should list the commands
# help queue count should explain the queue count function
# help queue print should explain the printing function
