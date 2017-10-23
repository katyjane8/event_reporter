require_relative 'event_reporter'
require_relative 'help'
require 'colorize'

class Runner
  attr_reader :zero_command, :one_command, :two_command
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
    gets.chomp.downcase
  end

  def start_commands
  when "queue" then queue_commands
  end

  def quit_commands(command)
    %w(q Q quit Quit QUIT).include?(command)
    puts `clear`
  end


end
run = Runner.new
run.start
