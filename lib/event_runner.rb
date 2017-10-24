require_relative 'command_base'

comm = Commander.new('./data/attendees_fixture.csv')
puts comm.welcome
