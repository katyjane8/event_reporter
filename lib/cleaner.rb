module Cleaner

  # self only extends the methods you tell it to in a module.
  # http://lizabinante.com/blog/modules-and-self-in-ruby/
  def self.clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def self.clean_name(name)
    if name == nil
      name = ""
    else
      name.strip.split.map{|word| word.capitalize}.join(' ')
    end
  end

end
