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

  def test_reporter_can_find_all_Marys_and_queue_them
    er = EventReporter.new('./data/full_event_attendees.csv')
    result = er.find_attendees(:first_name, "Mary")

    assert_equal 16, result.count
    refute er.list.empty?
  end

  def test_queue_can_be_sorted_and_first_in_sort_has_20009_zipcode
    er = EventReporter.new('./data/attendees_fixture.csv')
    er.find_attendees(:first_name, "Sarah")
    result = er.sort_queue(:state)

    assert_equal "20009", result.first.zipcode
  end

  # def test_it_can_print_all_Mary_Kates
  #   er = EventReporter.new('./data/attendees_fixture.csv')
  #   er.find_attendees(:first_name, "Mary Kate")
  #   result = er.print_sorted(:first_name)
  #
  #   assert_equal "", result
  # end

  def test_find_SLC_in_CSV
    er = EventReporter.new('./data/full_event_attendees.csv')
    result = er.find_attendees(:city, "Salt Lake City")

    assert_equal 13, result.count
  end

  def test_CSV_can_be_written_with_queue
    er = EventReporter.new('./data/full_event_attendees.csv')
    result = er.find_attendees(:zipcode, "90210")

    assert_equal 1, er.write_list.count
  end

end
