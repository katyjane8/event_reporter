require_relative 'event_reporter'
require_relative 'help'
require_relative 'messages'
require 'colorize'

class Runner
  include Messages
  attr_reader :zero_command, :one_command, :two_command, :er
  def initialize
    @zero_command = ""
    @one_command = ""
    @two_command = ""
    @er = EventReporter.new('./data/attendees_fixture.csv')
  end

  def start
    welcome_message
    input = gets.chomp.downcase
    case input
    when "load" then @er.load_all_attendees('./data/attendees_fixture.csv')
    end
    # if quit_commands(zero_command)
    #   exit
    # else
    #   start_commands(zero_command)
    # end
  end

  def start_commands(command)
    case command
    # when "load" then @er.load_all_attendees
    when "queue" then queue_commands
    when "find" then find_commands
    when "help" then help.list_commands
    when "quit" then quit_commands(zero_command)
    end
  end

  def queue_commands
    event_reporter.queue_count
    event_reporter.clear_queue
    event_reporter.print_queue
    event_reporter.print_sorted
  end

end
run = Runner.new
puts run.start
