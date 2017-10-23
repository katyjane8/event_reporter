require "csv"
require_relative "queue"
require_relative "attendee"

class EventReporter
  attr_reader :all_attendees, :list

  def initialize(file_name)
    @all_attendees = []
    @list = List.new
    load_all_attendees(file_name)
  end

  def load_all_attendees(file_name)
    CSV.foreach(file_name, headers: true, header_converters: :symbol) do |row|
      @all_attendees << Attendee.new(row)
    end
  end

  def queue_count
    @list.count
  end

  def find_attendees(attribute, criteria)
    @all_attendees.each do |attendee|
      if criteria == attendee.send(attribute)
        @list << attendee
      end
    end
    @list
  end

  def clear_queue
    @list.clear
  end

  def print_queue
    @list.each { |x| print x }
  end

  def print_sorted
    @list.sort_by{ |l| l[:last_name] }
    return @list
    print_queue
  end

  def write_list
    headers = [:first_name,:last_name,:email,:phone,:street,
               :city,:state,:zipcode]
    CSV.open("city_sample.csv", "wb") do |csv|
      csv << headers
      @list.each do |att|
        csv << [att.first_name, att.last_name, att.email, att.phone, att.street,
          att.city, att.state, att.zipcode]
      end
    end
  end

end

#
# search_criteria = {'first_name' => 'John'}
# option = {:headers => :first_row}

# contents do |csv|
#   matches = csv.find_all do |row|
#     match = true
#     search_critera.keys.each do |key|
#       match = match && ( row[key] == search_critera[key] )
#     end
#     match
#   end
#   headers = csv.headers
# end
  # def clean_zipcode(zipcode)
  #   zipcode.to_s.rjust(5,"0")[0..4]
  # end
  #
  # puts "EventManager Initialized!"
  #
  #   last_name = row[:last_name]
  #   email = row[:Email_Address]
  #   phone = row[:home_phone]
  #   zipcode = clean_zipcode(row[:zipcode])



# The Queue
#
# The program has a concept called the “queue”. The queue holds the stored results from a previous search. As a user, I issue a search command to find records, then later issue another command to do work with those results. The queue is not cleared until the user runs the command queue clear or a new find command.
#
# The REPL
#
# The program must respond to the following commands:
#
# load <filename>
#
# Erase any loaded data and parse the specified file. If no filename is given, default to full_event_attendees.csv.
#
# find <attribute> <criteria>
#
# Populate the queue with all records matching the criteria for the given attribute. Example usages:
#
# find zipcode 20011
# find last_name Johnson
# find state VA
# The comparison should:
#
# Be case insensitive, so "Mary" and "mary" would be found in the same search
# Be insensitive to internal whitespace, but not external:
# "John" and "John " are considered matches
# "John Paul" and "Johnpaul" are not matches
# Not do substring matches, so a find first_name Mary does not find a record with first name "marybeth"
# queue count
#
# Output how many records are in the current queue
#
# queue clear
#
# Empty the queue
#
# queue print
#
# Print out a tab-delimited data table with a header row following this format:
#
#   LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE
# queue print by <attribute>
#
# Print the data table sorted by the specified attribute like zipcode.
#
# queue save to <filename.csv>
#
# Export the current queue to the specified filename as a CSV. The file should should include data and headers for last name, first name, email, zipcode, city, state, address, and phone number.
#
# queue export html <filename.csv>
#
# Export the current queue to the specified filename as a valid HTML file. The file should use tables and include the data for all of the expected information.
#
# help
#
# Output a listing of the available individual commands
#
# help <command>
#
# Output a description of how to use the specific command. For example:
#
# help queue clear
# help find
