require_relative 'runner'

run = Runner.new('./data/attendees_fixture.csv')
puts run.welcome
