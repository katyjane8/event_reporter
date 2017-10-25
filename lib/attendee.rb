require_relative "cleaner"

class Attendee
  include Cleaner

  attr_reader :first_name, :last_name, :email_address,
  :home_phone, :street, :city, :state, :zipcode
  # ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode

  def initialize(row)
    # @reg_date = row[:regdate]
    @first_name = Cleaner.clean_name(row[:first_name])
    @last_name = Cleaner.clean_name(row[:last_name])
    @email_address = row[:email_address]
    @home_phone = row[:homephone]
    @street = row[:street]
    @city = Cleaner.clean_name(row[:city])
    @state = Cleaner.clean_name(row[:state])
    @zipcode = Cleaner.clean_zipcode(row[:zipcode])
  end

end
