require "minitest/autorun"
require "minitest/pride"
require "minitest/spec"
require "./lib/help"

class HelpTest < Minitest::Test

  def test_help_will_list_commands_available
    help = Help.new

    assert_output(/queue print/) {help.list_commands}
  end

  def test_help_queue_count_explains_queue_count_method
    describe "Welcome to help count" do
      before do
        def get_help_count; "test string" end
      end

      it "should work" do
        get_help_count.must_equal "The help queue count will count the amount of attendees in the queue."
      end
    end
  end

  def test_help_queue_print_explains_printing_method
    describe "Welcome to help print" do
      before do
        def get_help_print; "test string" end
      end

      it "should work" do
        get_help_print.must_equal "The help queue print will print."
      end
    end
  end
end
