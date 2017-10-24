require_relative "attendee"
require_relative "event_reporter"

class List
  attr_reader :queue

  def initialize
    @queue = []
  end

  def queue_count
    @queue.length
  end

  def clear_queue
    @queue.clear
  end

  def print_queue
    @queue.each { |x| print x }
  end

  #this is NOT WORKINGGG
  def print_sorted(attribute)
    @queue.sort_by
  end

  def <<(attendee)
    @queue << attendee
  end

  def print
    @queue.each { |x| print x }
  end

  def sort_by
    @queue
  end

end

# @uploaded_csvs = {'dates' => [], 'last_names' => [], 'first_names' => ['bob', 'john', 'john']}
#
# @uploaded_csvs['first_names']
#
# @query_resuts = []
