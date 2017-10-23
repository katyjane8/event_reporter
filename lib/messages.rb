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
    puts "Welcome to Event Reporter. Type 'help' for a list of commands. Or enter command to begin.".cyan.bold.underline
  end

  def quit_commands(command)
    %w(q Q quit Quit QUIT).include?(command)
    puts `clear`
  end

end
