require 'database_connection.rb'

class Space

  attr_reader :id, :user_id, :space_name, :description, :price_per_night

  def initialize(id, user_id, space_name, description, price_per_night)
    @id = id
    @user_id = user_id
    @space_name = space_name
    @description = description
    @price_per_night = price_per_night
  end

  def self.create(user_id:, space_name:, description:, price_per_night:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces (user_id, space_name, description, price_per_night)
      VALUES ('#{user_id}', '#{space_name}', '#{description}', '#{price_per_night}')
      RETURNING id, user_id, space_name, description, price_per_night")
    Space.new(result[0]["id"],
      result[0]["user_id"],
      result[0]["space_name"],
      result[0]["description"],
      result[0]["price_per_night"]
    )
  end
end
