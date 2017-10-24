require "minitest/autorun"
require "minitest/pride"
require "./lib/event_reporter"

class EventReporterTest < Minitest::Test
  def test_CSV_loads_all_attendees
    er = EventReporter.new('./data/full_event_attendees.csv')

    assert_equal 5175, er.all_attendees.count
  end

  def test_reporter_can_find_all_Johns
    er = EventReporter.new('./data/full_event_attendees.csv')
    result = er.find_attendees(:first_name, "John")

    assert_equal 63, result.count
  end

  def test_queue_can_be_cleared
    er = EventReporter.new('./data/full_event_attendees.csv')
    list = List.new

    er.find_attendees(:first_name, "Rachel")
    refute er.list.empty?

    list.clear_queue
    assert_equal 0, list.queue_count
  end

  def test_reporter_can_find_all_Marys_and_queue_them
    er = EventReporter.new('./data/full_event_attendees.csv')

    result = er.find_attendees(:first_name, "Mary")

    assert_equal 16, result.count
    refute er.list.empty?
  end

  # def test_it_can_print_all_Marys
  # end

  def test_queue_print_by_last_name
    er = EventReporter.new('./data/full_event_attendees.csv')
    list = List.new
    er.find_attendees(:last_name, "Smith")

    assert_equal 35, list.print_sorted(:last_name).count
  end

  def test_find_SLC_in_CSV
    er = EventReporter.new('./data/full_event_attendees.csv')
    result = er.find_attendees(:city, "Salt Lake City")

    assert_equal 13, result.count
  end

  def test_CSV_can_be_written_with_queue
    skip
    er = EventReporter.new('./data/full_event_attendees.csv')

    assert_equal 45, er.write_list
  end

end
