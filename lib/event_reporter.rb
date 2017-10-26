require_relative 'queue'
require_relative 'attendee'
require 'csv'
require 'erb'

class EventReporter
  attr_reader :all_attendees, :queue, :list

  def initialize(file_name = './data/full_event_attendees.csv')
    @file_name = file_name
    @all_attendees = []
    @list = []
    load_all_attendees
    @table_header = ['LAST NAME','FIRST NAME','EMAIL','ZIPCODE','CITY','STATE','ADDRESS','PHONE']
    @queue = []
  end

  def load_all_attendees
    CSV.foreach(@file_name, headers: true, header_converters: :symbol) do |row|
      @all_attendees << Attendee.new(row)
    end
    "load was successful"
  end

  def find_attendees(attribute, criteria)
    @all_attendees.each do |attendee|
      if criteria.downcase == attendee.send(attribute).downcase
        @list << attendee
      end
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

  def printing_header
    format = '%-12s %-12s %-12s %-10s %-10s %-10s %-12s %s'
    format @table_header.to_s
    @table_header
  end

  def printing_queue
    format_queue
  end

  def format_queue
    format = '%-12s %-12s %-12s %-10s %-10s %-10s %-12s %s'
      if @queue.length == 0
        "Please enter criteria in queue"
      else
        print_sorted(input).each do |attender|
          printed = attender.input
          require "pry"; binding.pry
          format % [printed]
        end
      end
  end

  def write_list(input)
    headers = [:first_name,:last_name,:email_address,:home_phone,:street,
               :city,:state,:zipcode]
    CSV.open("./data/#{input}", "wb") do |csv|
      csv << headers
      @list.each do |att|
        csv << [att.first_name, att.last_name, att.email_address,
          att.home_phone, att.street, att.city, att.state, att.zipcode]
      end
    end
  end

  def write_list_html(filename)
    template_file = File.read "template.erb"
    erb_file = ERB.new template_file
    form_file = erb_file.result(binding)

    Dir.mkdir("html") unless Dir.exists? "html"
    file = "html/#{filename}"

    File.open(file, "w") do |path|
      path.puts form_file
    end
  end

end
