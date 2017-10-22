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

  def help_queue_count
    input = gets.chomp
    if gets.chomp == "help queue count"
      puts "The help queue count will print the count of the attendees in the queue".yellow
    end
  end

  def help_queue_print
    input = gets.chomp
    if input == "help queue count"
      puts "The help queue print will print."
    end
  end

  def quit
    input = gets.chomp
    if input == "quit" then exit
    end
  end

end
