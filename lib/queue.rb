require_relative 'attendee'

class List
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def queue_count
    @queue.length
  end

  def clear_queue
    @queue.clear
  end

end
