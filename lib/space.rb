class Space

  attr_reader :user_id, :space_name, :description, :price_per_night

  def initialize(user_id, space_name, description, price_per_night)
    @user_id = user_id
    @space_name = space_name
    @description = description
    @price_per_night = price_per_night
  end

  def self.create(user_id:, space_name:, description:, price_per_night:)
    Space.new(user_id, space_name, description, price_per_night)
  end
end
