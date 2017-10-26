require_relative 'event_reporter'
require_relative 'messages'
require_relative 'queue'
require_relative 'printer'
require 'colorize'

class Commander
  include Messages
  def initialize
    @er = EventReporter.new
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
    elsif command != nil && command == "queue" && filename == "save"
      help_queue_save
    elsif command != nil && command == "queue" && filename == "export"
      help_queue_export
    elsif command != nil && command == "load" && filename == "file"
      help_load_file
    elsif command != nil && command == "find"
      help_find
    elsif command != nil && command == "criteria"
      criteria_help
    else
      list_commands
    end
  end

  def load_csv(filename)
    @er = EventReporter.new
    if filename.nil?
      puts @er.load_all_attendees
    else filename != "full_event_attendees.csv"
      @er = EventReporter.new("./data/#{filename}")
      puts @er.load_all_attendees
    end
  end

  def find_people(attribute, criteria)
    puts @er.find_attendees(attribute, criteria)
  end

  def queue_commands(output, action, input)
     if output == "count"
       puts @er.list.count
     elsif output == "clear"
       puts @er.list.clear
     elsif output == "print"
       puts @er.printing_header
     elsif output == "print by" && "#{action}"
       puts @er.printing_queue
     elsif output == "save" && action == "to"
       puts @er.write_list(input)
     else output == "export" && action == "html"
       puts @er.write_list_html(input)
     end
  end

end
