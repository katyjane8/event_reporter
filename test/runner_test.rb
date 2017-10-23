require "minitest/autorun"
require "minitest/pride"
require "./lib/runner"

class RunnerTest < Minitest::Test
  def test_it_exists
    run = Runner.new

    assert_instance_of Runner, run
  end

  def test_welcome_puts_welcome_message
    run = Runner.new

  end


end
