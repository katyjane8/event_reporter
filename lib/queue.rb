require_relative "attendee"

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

  def print
    @queue.each { |x| print x }
  end

end
