require_relative 'event_reporter'
require_relative 'messages'
require_relative 'queue'
require_relative 'printer'
require 'colorize'

class Runner
  include Messages
  attr_reader :file_name, :input
  def initialize(file_name)
    @file_name = file_name
    @er = EventReporter.new(file_name)
    @list = List.new
    @print = Printer.new
    @input = input
    @first_string = ""
    @second_string = ""
    @third_string = ""
  end

  def welcome
    welcome_message
    gets_input
    if quit_commands(first_string)
      exit
    else
      start_commands(first_string)
    end
  end

  def gets_input
    user_input = gets.chomp.downcase
    set_input
  end

  def set_input
    @first_string = input.first_string
    @second_string = input.second_string if input.second_string != nil
    @third_string = input.third_string if input.third_string != nil
  end

  def start_commands(input)
    # @one_command = ""[1]
    # @two_command = ""
    input = gets.chomp.downcase
    case input
    when "load" then puts "Please enter filename"
      # filename = gets.chomp.downcase
      # if filename == "./data/city_sample.csv"
      #   puts @er.load_all_attendees("./data/city_sample.csv")
      # else
      #   puts @er.load_all_attendees("./data/full_event_attendees.csv")
      # end
    when "find" then @er.find_attendees(:zipcode, "21230")
    when "queue" then queue_commands
    when quit_commands(input) then exit
    end
    start_commands
  end

  def queue_commands
    input = gets.chomp.downcase
    case input
    when "clear" then @list.clear_queue
    when "count" then @list.queue_count
    when "print" then @print.printing_header
    when "print by" then @print.printing_queue(two_command)
    # when "save to" then ""(two_command)
    # when "export html" then ""(two_command)
    end
    queue_commands
  end

end
