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
    start
  end

  def start
    input = gets.chomp.split(" ")
    if input[0] == "quit"
      exit
    else
      start_commands(input)
    end
    start
  end

  def start_commands(input)
    case input[0]
    when "load" then load_csv(input[1])
    when "find" then find_people(input[1], input[2])
    when "queue" then queue_commands(input[1], input[2], input[3])
    when "help" then helper_commands(input[1], input[2], input[3])
    when "quit" then exit
    end
  end

  def helper_commands(command, filename=nil, attribute=nil)
    if command != nil && command == "queue" && filename == "count"
      help_queue_count
    elsif command != nil && command == "queue" && filename == "clear"
      help_queue_clear
    elsif command != nil && command == "queue" && filename == "print"
      help_queue_print
    elsif command != nil && command == "queue" && filename == "print by"
      help_queue_print_by
    else
      list_commands
    end
  end

  def load_csv(filename)
    @er = EventReporter.new
    if filename == nil
      puts @er.load_all_attendees
    elsif filename != "full_event_attendees.csv"
      @er = EventReporter.new("./data/#{filename}")
      puts @er.load_all_attendees
    else
      puts @er.load_all_attendees
    end
  end

  def find_people(criteria, attribute)
    @er = EventReporter.new
    puts @er.find_attendees(criteria, attribute)
  end

  def queue_commands(output, action, attribute)
    @list = List.new
    @er = EventReporter.new
     if output == "clear"
       puts @list.clear_queue
     elsif output == "count"
       puts @list.queue.count
     elsif output == "print"
       puts @print.printing_queue
     elsif output == "print" && action == "by" && "#{attribute}"
       puts @print.printing_queue
     elsif output == "save" && action == "to" && "./data/#{attribute}"
       puts @er.write_list(attribute)
     else output == "export" && action == "html" && "./data/#{attribute}"
       puts @er.write_list_html(attribute)
     end
  end

end
