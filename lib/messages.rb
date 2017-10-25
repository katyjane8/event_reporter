require 'colorize'

module Messages

  def criteria_help
    puts "The criteria you can search for are:
      - first_name
      - last_name
      - email
      - zipcode
      - street
      - city
      - state
      - home_phone".white
  end

  def welcome_message
    puts "Welcome to Event Reporter. Type 'help' for a list of commands. Or enter command to begin.".cyan.bold
  end
#
  # def quit_commands(command)
  #   %w(q Q quit Quit QUIT).include?(command)
  # end

  def list_commands
    puts "\t    ________________________________________________________________
            ================================================================
            ||  Available Commands:                                       ||
            ||   load <filename>, find <attribute> <criteria>,            ||
            ||   queue count, queue clear, queue print,                   ||
            ||   queue print by <attribute>,                              ||
            ||   queue save to <filename.csv>,                            ||
            ||   queue export html <filename.html>, help <command>, quit  ||
            ================================================================
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            ".yellow
  end

  # def list_commands
  #   Terminal::Table.new :title => "Available Commands", :headings => ["load <filename>", "3", "4"],
  #       :rows => ["load"],
  #       :style => {:width => 80, :alignment => :center, :border_x => "=", :border_i => "x"}
  # end



  def help_queue_count
    puts "The help queue count will count the amount of attendees in the queue.".yellow
  end

  def help_queue_print
    puts "The help queue print will print.".light_green
  end

  def help_queue_clear
    puts "The help".blue
  end

end
