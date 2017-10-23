require_relative 'event_reporter'
require_relative 'help'
require 'colorize'

class Runner

  def initialize
    @zero_command = ""
    @one_command = ""
    @two_command = ""
  end

  def start
    welcome
    get_input
    if quit_commands(zero_command)
      exit
    else
      start_commands(zero_command)
    end
  end

  def welcome
    puts "Welcome to Event Reporter. Type 'help' for a list of commands. Or enter command to begin.".cyan.bold.underline
  end

  def get_input
    user_input = gets.chomp.downcase
    commands.change_commands(user_input)
    set_commands
  end

  def start_commands(command)
    case command
    when "queue" then queue_commands(one_command, two_command)
    when "help"  then help(one_command)
    when "load"  then load_csv
    when "find"  then find(one_command,two_command)
    else
      start
    end
  end

  def quit_commands(command)
    %w(q Q quit Quit QUIT).include?(command)
    puts `clear`
  end

  def clear_screen
   puts `clear`
  end


end
run = Runner.new
run.start
