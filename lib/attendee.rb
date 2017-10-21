class Attendee

  attr_accessor :first_name, :last_name, :email_address,
  :home_phone, :street, :city, :state, :zipcode
  # ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode

  def initialize(row)
    @first_name = row[:first_name]
    @last_name = row[:last_name]
    @email_address = row[:email_address]
    @home_phone = (row[:homephone])
    @street = row[:street]
    @city = (row[:city])
    @state = (row[:state])
    @zipcode = (row[:zipcode])
  end
end
