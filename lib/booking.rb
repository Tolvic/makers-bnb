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

  def self.find(space_id)
    return nil unless space_id

    bookings = DatabaseConnection.query("SELECT * FROM bookings WHERE space_id = '#{space_id}'")

    bookings.map do |booking|
        Booking.new(booking["id"],
        booking["user_id"],
        booking["space_id"],
        booking["availability_id"],
        booking["approval_status"]
      )
    end
  end

  def self.approve(id)
    return nil unless id

    result = DatabaseConnection.query(
      "UPDATE bookings
      SET approval_status = 'approved'
      WHERE id = '#{id}'
      RETURNING id, user_id, space_id, availability_id, approval_status"
    )

    result = Booking.new(
      result[0]["id"],
      result[0]["user_id"],
      result[0]["space_id"],
      result[0]["availability_id"],
      result[0]["approval_status"]
    )

    DatabaseConnection.query(
      "UPDATE bookings
      SET approval_status = 'declined'
      WHERE space_id = '#{result.space_id}' AND availability_id = #{result.availability_id} AND NOT id = #{result.id}"
    )
  end
end
