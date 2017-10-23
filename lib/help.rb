require 'colorize'

class Help

  def list_commands
    puts "\t________________________________________________________________
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

  def get_help_count
    gets.chomp
  end

  def help_queue_count
    puts "***You've asked for help!***".yellow
    action = get_help_count
    return "The help queue count will count the amount of attendees in the queue."
  end

  def get_help_print
    gets.chomp
  end

  def help_queue_print
    puts "***You've asked for help!***".yellow
    action = get_help_print
    return "The help queue print will print."
  end

  def quit
    input = gets.chomp
    if input == "quit" then exit
    end
  end

end
