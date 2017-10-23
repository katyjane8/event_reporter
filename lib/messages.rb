require 'colorize'

module Messages

  def attribute_help
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

  def queue_commands
    queue count
    queue clear
    queue print
    queue print by
  end


end
