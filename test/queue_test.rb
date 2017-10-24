require "minitest/autorun"
require "minitest/pride"
require "./lib/queue"

class ListTest < Minitest::Test
  def test_queue_count_in_event
    er = EventReporter.new('./data/full_event_attendees.csv')

    assert_equal 0, er.queue_count
  end

  def test_queue_print_by_last_name
    er = EventReporter.new('./data/full_event_attendees.csv')
    list = List.new
    er.find_attendees(:last_name, "Smith")

    assert_equal 35, list.print_sorted(:last_name).count
  end

end
