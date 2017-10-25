require "csv"
require_relative "queue"
require_relative "attendee"

class EventReporter
  attr_reader :all_attendees, :queue, :list

  def initialize(file_name = './data/full_event_attendees.csv')
    @file_name = file_name
    @all_attendees = []
    @list = []
    load_all_attendees
  end

  def load_all_attendees
    CSV.foreach(@file_name, headers: true, header_converters: :symbol) do |row|
      @all_attendees << Attendee.new(row)
    end
    "load was successful"
  end

  def find_attendees(attribute, criteria)
    @all_attendees.each do |attendee|
      if criteria == attendee.send(attribute)
        @list << attendee
      end
      # .map do |row|
      # print "#{row.first_name}" + " " + attribute.to_s + ":" + criteria
    end
    @list
  end

  def sort_queue(attribute)
    @list.sort_by do |att|
      att.send(attribute)
    end
  end

  def print_sorted(attribute)
    sort_queue(attribute)
  end

  def write_list
    headers = [:first_name,:last_name,:email_address,:home_phone,:street,
               :city,:state,:zipcode]
    CSV.open("./data/city_sample.csv", "wb") do |csv|
      csv << headers
      @list.each do |att|
        csv << [att.first_name, att.last_name, att.email_address,
          att.home_phone, att.street, att.city, att.state, att.zipcode]
      end
    end
  end

end
