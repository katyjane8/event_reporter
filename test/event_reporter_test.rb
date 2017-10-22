require "minitest/autorun"
require "minitest/pride"
require "./lib/event_reporter"

class EventReporterTest < Minitest::Test
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

    result = er.find_attendees(:first_name, "John")

    assert_equal 63, result.count
  end

  def test_queue_can_be_cleared
    er = EventReporter.new('./lib/full_event_attendees.csv')

    er.find_attendees(:first_name, "Rachel")
    refute er.list.queue.empty?

    er.clear_queue
    assert_equal 0, er.queue_count
  end

  def test_help_will_list_commands_available
    
  end

  def test_help_queue_count_explains_queue_count_method
    # help queue count should explain the queue count function
  end

  def test_help_queue_print_explains_printing_method
    # help queue print should explain the printing function
  end
end
