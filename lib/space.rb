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

  def self.all
    all = DatabaseConnection.query("SELECT * FROM spaces").to_a
    all.map do |space|
      Space.new(space["id"],
      space["user_id"],
      space["space_name"],
      space["description"],
      space["price_per_night"]
      )
    end
  end
end
