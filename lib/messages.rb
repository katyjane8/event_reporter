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

  def help_queue_count
    puts "The help queue count will count the amount of attendees in the queue.".yellow
  end

  def help_queue_print
    puts "The help queue print will print.".light_green
  end

  def help_queue_clear
    puts "The help queue clear will clear your queue.".blue
  end

end
