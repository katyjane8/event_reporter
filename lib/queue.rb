class List

  attr_reader :queue

  def initialize
    @queue = []
  end

  def <<(attendee)
    @queue << attendee
  end

  def count
    @queue.length
  end

  def clear
    @queue.clear
  end

end


# @uploaded_csvs = {'dates' => [], 'last_names' => [], 'first_names' => ['bob', 'john', 'john']}
#
# @uploaded_csvs['first_names']
#
# @query_resuts = []
