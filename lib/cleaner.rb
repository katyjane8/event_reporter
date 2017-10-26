module Cleaner
  # self only extends the methods you tell it to in a module.
  # http://lizabinante.com/blog/modules-and-self-in-ruby/
  def self.clean_zipcode(zipcode)
    if zipcode == nil
      zipcode = ""
    else
      zipcode.to_s.rjust(5,"0")[0..4]
    end
  end

  def self.clean_name(name)
    if name == nil
      name = ""
    else
      name.strip.split.map{|word| word.capitalize}.join(' ')
    end
  end

  def self.clean_state(state)
    if state == nil
      state = ""
    else
      state.strip.split.map{|word| word.upcase}.join(' ')
    end
  end

  def self.clean_phone(phone_number)
    if phone_number == nil
      phone_number = ""
    else
      phone_number.delete('. ()-').rjust(10, "0")
    end
  end

end
