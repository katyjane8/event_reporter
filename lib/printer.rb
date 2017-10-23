require 'colorize'

class Printer
  # Print out a tab-delimited data table with a header row following this format:

  # LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE
  def printing_queue
    File.open("test_list.txt", "a") do |line|
      line.puts "\r" + "LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE"
    end 
  end
end
