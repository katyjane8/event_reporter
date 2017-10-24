require_relative 'event_reporter'
require_relative 'queue'
require 'colorize'

class Printer
  def initialize
    @er = EventReporter.new('./data/attendees_fixture.csv')
    @table_header = ['LAST NAME','FIRST NAME','EMAIL','ZIPCODE','CITY','STATE','ADDRESS','PHONE']
    @queue = List.new
  end

  def printing_header
    format = '%-4s %-4s %-4s %-4s %-4s %-4s %-24s %s'
    puts format % @table_header
  end

  def printing_queue
    format = '%-4s %-4s %-4s %-4s %-4s %-4s %-24s %s'
    # require "pry"; binding.pry
      if @queue.count == 0
        puts "Please enter criteria in queue"
      else
        @er.print_sorted(:zipcode).each do |attendee|
          zip = attendee.zipcode
          puts format % [zip]
        end
      end
  end
  # Print the data table sorted by the specified attribute like zipcode.


end

pri = Printer.new
er = EventReporter.new('./data/attendees_fixture.csv')
puts er.find_attendees(:city, "Salt Lake City")
puts pri.printing_header
puts pri.printing_queue