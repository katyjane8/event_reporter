require_relative 'event_reporter'
require 'colorize'

class Printer

  def initialize
    @er = EventReporter.new('./data/attendees_fixture.csv')
    @table_header = ['LAST NAME','FIRST NAME','EMAIL','ZIPCODE','CITY','STATE','ADDRESS','PHONE']

  end
  # Print out a tab-delimited data table with a header row following this format:

  # LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE
  def printing_header
    format = '%-4s %-4s %-4s %-4s %-4s %-4s %-24s %s'
    puts format % @table_header
  end

  # @er.print_queue.each_with_index do |attendee, index|
  #   zip = attendee.zipcode
  #   puts format % [zip]
  # end

end

pri = Printer.new
puts pri.printing_header
