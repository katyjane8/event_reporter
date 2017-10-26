require_relative 'event_reporter'
require_relative 'queue'
require 'colorize'

class Printer
  attr_reader :queue

  def initialize
    @er = EventReporter.new('./data/att_fixture.csv')
    @table_header = ['LAST NAME','FIRST NAME','EMAIL','ZIPCODE','CITY','STATE','ADDRESS','PHONE']
    @queue = []
  end

  # def printing_header
  #   format = '%-12s %-12s %-12s %-10s %-10s %-10s %-12s %s'
  #   format @table_header.to_s
  #   @table_header
  # end
  #
  # def printing_queue
  #   format_queue
  # end
  #
  # def format_queue
  #   format = '%-12s %-12s %-12s %-10s %-10s %-10s %-12s %s'
  #     if @queue.length == 0
  #       "Please enter criteria in queue"
  #     else
  #       @er.print_sorted(input).each do |attendee|
  #         printed = attendee.input
  #         format % [printed]
  #       end
  #     end
  # end
end
