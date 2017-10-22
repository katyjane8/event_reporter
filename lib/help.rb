require 'colorize'
require 'terminal-table'

class Help

  def initialize
    @queue_commands = "queue export html <filename.csv>", "queue print by <attribute>", "queue count", "queue print"
    @other_commands = "load <filename>", "find <attribute> <criteria>", "quit"
  end

  def welcome_message
    puts "Welcome to HELP\n".light_blue
  end

  def list_commands
    Terminal::Table.new :title => "Available Commands", :headings => @queue_commands, :rows => @other_commands, :style => {:width => 45, :alignment => :center, :border_x => "=", :border_i => "x"}
  end

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

help = Help.new
puts help.list_commands
