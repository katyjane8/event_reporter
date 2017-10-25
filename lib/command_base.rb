require_relative 'event_reporter'
require_relative 'messages'
require_relative 'queue'
require_relative 'printer'
require 'colorize'

class Commander
  include Messages
  def initialize
    # @er = EventReporter.new
    @list = List.new
    @print = Printer.new
  end

  def welcome
    welcome_message
    input = gets.chomp.split(" ")
    if input[0] == "quit"
      exit
    else
      start_commands(input)
    end
  end

  def start_commands(input)
    # require "pry"; binding.pry
    case input[0]
    when "load" then load_csv(input[1])
    when "find" then find_people(input[1], input[2])
    when "queue" then queue_commands
    when "quit" then exit
    end
  end

  def load_csv(filename)
    @er = EventReporter.new("./data/#{filename}")
    if filename != "full_event_attendees.csv"
      puts @er.load_all_attendees
    else
      puts @er.load_all_attendees
    end
  end

  def find_people(input[1], input[2])
    @er = EventReporter.new
    @er.find_attendees(input[1], input[2])
    input[1] = 
    if response == "zipcode #{attribute}"
      puts @er.find_attendees(:zipcode)
    end
  end

  def queue_commands(second_string, third_string)
    case second_string
    when "clear" then @list.clear_queue
    when "count" then @list.queue_count
    when "print" then @print.printing_header
    when "print by" then @print.printing_queue(two_command)
    # when "save to" then ""(two_command)
    # when "export html" then ""(two_command)
    end
  end

end

















#
# def gets_input
#   user_input = gets.chomp.downcase
#   # set_input
# end

# def first_string
#   @first_string = input
# end

# def second_string
#   @second_string =
# end
#
# def third_string
#   @third_string = input.third_string if input.third_string != nil
# end
#
# def set_input
#   first_string
#   second_string
#   third_string
# end
