class Space

  attr_reader :user_id, :space_name, :description

  def initialize(user_id, space_name, description)
    @user_id = user_id
    @space_name = space_name
    @description = description
  end

  def self.create(user_id:, space_name:, description:)
    Space.new(user_id, space_name, description)
  end
end
