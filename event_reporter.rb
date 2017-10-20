require "csv"
require "./queue"


  lines = File.readlines "full_event_attendees.csv"
  lines.each do |line|
    puts line
    puts Queue.new.count
  end
  # def clean_zipcode(zipcode)
  #   zipcode.to_s.rjust(5,"0")[0..4]
  # end

  # puts "EventManager Initialized!"
  # contents = CSV.open "full_event_attendees.csv", headers: true, header_converters: :symbol

  # contents.foreach(file) do |row|
  #   puts row
  # end


  # A. Happy Paths
  #
  # load full_event_attendees.csv
  # queue count should return 0
  # find first_name John
  # queue count should return 63
  # queue clear
  # queue count should return 0
  # help should list the commands
  # help queue count should explain the queue count function
  # help queue print should explain the printing function










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
