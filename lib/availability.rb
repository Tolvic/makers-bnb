require 'pg'

class Availability
  attr_reader :spaces_id, :available_dates, :id
  @arr = []

  def initialize(id, spaces_id, available_dates)
    @id = id
    @spaces_id = spaces_id
    @available_dates = available_dates
  end

  def self.create(spaces_id, available_dates)
    result = DatabaseConnection.query(
      "INSERT INTO availability (spaces_id, available_dates)
      VALUES ('#{spaces_id}', '#{available_dates}')
      RETURNING id, spaces_id, available_dates")
      Availability.new(result[0]["id"], result[0]["spaces_id"],
      result[0]["available_dates"]
    )
  end

  def self.all(sid)
    all = DatabaseConnection.query("SELECT * FROM availability WHERE spaces_id = #{sid}").to_a

    list = all.map do |date|
      Availability.new(date["id"], date["spaces_id"], date["available_dates"])
    end
    list.each do |item|
      item.available_dates
    end
  end
end
