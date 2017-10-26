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
      - home_phone".cyan
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
    puts "Queue count will count the amount of attendees in the queue.".yellow
  end

  def help_queue_print
    puts "Queue print will print the queue.".light_green
  end

  def help_queue_clear
    puts "Queue clear will clear your queue.".blue
  end

  def help_queue_print_by
    puts "Queue print by will print with specific attributes.".green
  end

  def help_queue_save
    puts "Queue save will save a new CSV file with criteria specified.".light_magenta
  end

  def help_queue_export
    puts "Queue export will save your CSV into a formatted HTML file.".red
  end

  def help_load_file
    puts "Load your file here into first and last name, email and phone number.".yellow
  end

  def help_find
    puts "Find what you want to see by entering criteria and attribute.".magenta
  end

end
