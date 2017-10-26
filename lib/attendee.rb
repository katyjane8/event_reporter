require_relative 'cleaner'

class Attendee
  include Cleaner

  attr_reader :first_name, :last_name, :email_address,
  :home_phone, :street, :city, :state, :zipcode

  def initialize(row)
    @first_name = Cleaner.clean_name(row[:first_name])
    @last_name = Cleaner.clean_name(row[:last_name])
    @email_address = row[:email_address]
    @home_phone = Cleaner.clean_phone(row[:homephone])
    @street = Cleaner.clean_name(row[:street])
    @city = Cleaner.clean_name(row[:city])
    @state = Cleaner.clean_state(row[:state])
    @zipcode = Cleaner.clean_zipcode(row[:zipcode])
  end

  def to_s
    "#{@first_name}, #{@last_name}, #{@email_address}, #{@home_phone}, #{@state}, #{@zipcode}"
  end
end
