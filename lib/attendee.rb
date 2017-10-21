class Attendee

  attr_accessor :first_name, :last_name, :email_address,
  :home_phone, :street, :city, :state, :zipcode
  # ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode

  def initialize(row)
    @reg_date = row[:regdate]
    @first_name = row[:first_name]
    @last_name = row[:last_name]
    @email_address = row[:email_address]
    @home_phone = row[:homephone]
    @street = row[:street]
    @city = row[:city]
    @state = row[:state]
    @zipcode = clean_zipcode(row[:zipcode])
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end
end
