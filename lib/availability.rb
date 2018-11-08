class Availability
  attr_reader :space_id, :date

  def initialize(space_id, date)
    @space_id = space_id
    @date = date
  end

  def self.create(space_id, date)
    Availability.new(space_id, date)
  end

end
