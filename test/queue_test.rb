require "minitest/autorun"
require "minitest/pride"
require "./lib/queue"

class ListTest < Minitest::Test
  def test_queue_count_in_event
    list = List.new

    assert_equal 0, list.queue_count
  end

  def test_queue_print_by_last_name
    er = EventReporter.new('./data/full_event_attendees.csv')
    er.find_attendees(:last_name, "Smith")
    er.sort_queue(:last_name)

    assert_equal 35, er.print_sorted(:last_name).count
  end

  def test_queue_can_be_cleared
    er = EventReporter.new('./data/full_event_attendees.csv')
    list = List.new

    er.find_attendees(:first_name, "Rachel")
    refute er.list.empty?

    list.clear_queue
    assert_equal 0, list.queue_count
  end

end
