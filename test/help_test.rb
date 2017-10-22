require "minitest/autorun"
require "minitest/pride"
require "./lib/help"

class HelpTest < Minitest::Test

  def test_help_will_list_commands_available
    help = Help.new

    assert_output(/queue print/) {help.list_commands}
  end

  def test_help_queue_count_explains_queue_count_method
    # help queue count should explain the queue count function
  end

  def test_help_queue_print_explains_printing_method
    # help queue print should explain the printing function
  end
end
