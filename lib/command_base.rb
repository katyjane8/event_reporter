require_relative 'event_reporter'
require_relative 'messages'
require_relative 'queue'
require_relative 'printer'
require 'colorize'

class Commander
  include Messages
  attr_reader :file_name, :input, :first_string, :second_string, :third_string
  def initialize(file_name)
    @file_name = file_name
    @er = EventReporter.new(file_name)
    @list = List.new
    @print = Printer.new
    # @first_string = nil
    # @second_string = nil
    # @third_string = nil
  end

  def welcome
    welcome_message
    input = gets.chomp
    if quit_commands(input)
      exit
    else
      start_commands(input)
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

  def start_commands(input)
    case input
    when "load" then load_csv
    when "find" then @er.find_attendees(:zipcode, "21230")
    when "queue" then queue_commands
    when quit_commands(input) then exit
    end
  end

  def load_csv
    puts "Please enter filename"
    filename = gets.chomp.downcase
    if filename == "city_sample"
      er = EventReporter.new("./data/city_sample.csv")
      puts er.all_attendees("./data/city_sample.csv")
    else
      puts @er.all_attendees("./data/full_event_attendees.csv")
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
    start_commands
  end

end
