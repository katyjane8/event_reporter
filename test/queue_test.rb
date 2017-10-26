require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/queue'

class ListTest < Minitest::Test
  def test_queue_count_in_event_at_default
    list = List.new

    assert_equal 0, list.queue_count
  end

  def test_queue_can_be_cleared
    list = List.new
    list.queue = [1, 2, 3]

    assert_equal 3, list.queue_count
    list.clear_queue
    assert_equal 0, list.queue_count
  end

end
