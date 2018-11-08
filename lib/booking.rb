class Booking
  attr_reader :id, :user_id, :space_id, :availability_id, :approval_status

  def initialize(id, user_id, space_id, availability_id, approval_status)
    @id = id
    @user_id = user_id
    @space_id = space_id
    @availability_id = availability_id
    @approval_status = approval_status
  end

  def self.create(user_id:, space_id:, availability_id:)
    result = DatabaseConnection.query(
      "INSERT INTO bookings (user_id, space_id, availability_id, approval_status)
      VALUES ('#{user_id}', '#{space_id}', '#{availability_id}', 'pending')
      RETURNING id, user_id, space_id, availability_id, approval_status")
    Booking.new(result[0]["id"],
      result[0]["user_id"],
      result[0]["space_id"],
      result[0]["availability_id"],
      result[0]["approval_status"]
    )
  end
end
