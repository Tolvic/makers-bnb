require 'pg'

class Availability
  attr_reader :spaces_id, :available_dates

  def initialize(spaces_id, available_dates)
    @spaces_id = spaces_id
    @available_dates = available_dates
  end

  def self.create(spaces_id, available_dates)
    result = DatabaseConnection.query(
      "INSERT INTO availability (spaces_id, available_dates)
      VALUES ('#{spaces_id}', '#{available_dates}')
      RETURNING id, spaces_id, available_dates")
      Availability.new(result[0]["spaces_id"],
      result[0]["available_dates"]
    )
  end
end
