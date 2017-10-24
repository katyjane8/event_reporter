require_relative 'event_reporter'
require_relative 'messages'
require 'colorize'

class Runner
  include Messages
  attr_reader :zero_command, :one_command, :two_command, :er, :file_name
  def initialize(file_name)
    @zero_command = ""
    @one_command = ""
    @two_command = ""
    @file_name = file_name
    @er = EventReporter.new(file_name)
  end

  def start
    welcome_message
    # require "pry"; binding.pry
    input = gets.chomp.downcase
    case input
    when "load" then @er.load_all_attendees(file_name)
    when "find" then @er.find_attendees(:zipcode, "21230")
    when "queue" then @er.queue_count

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
    when "help" then help.list_commands
    when "quit" then quit_commands(zero_command)
    end
  end

  def queue_commands
    @er.queue_count
    @er.clear_queue
    @er.print_queue
    @er.print_sorted
  end

end
run = Runner.new('./data/attendees_fixture.csv')
puts run.start
