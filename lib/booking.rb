class Booking
  attr_reader :id, :renter_user_id, :space_id, :availability_id, :approval_status

  def initialize(id, renter_user_id, space_id, availability_id, approval_status)
    @id = id
    @renter_user_id = renter_user_id
    @space_id = space_id
    @availability_id = availability_id
    @approval_status = approval_status
  end

  def self.create(renter_user_id:, space_id:, availability_id:)
    result = DatabaseConnection.query(
      "INSERT INTO bookings (renter_user_id, space_id, availability_id, approval_status)
      VALUES ('#{renter_user_id}', '#{space_id}', '#{availability_id}', 'pending')
      RETURNING id, renter_user_id, space_id, availability_id, approval_status")
    Booking.new(result[0]["id"],
      result[0]["renter_user_id"],
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
        booking["renter_user_id"],
        booking["space_id"],
        booking["availability_id"],
        booking["approval_status"]
      )
    end
  end

  def self.find_my_requests(user_id)
    return nil unless user_id

    bookings = DatabaseConnection.query("SELECT spaces.space_name, spaces.description, spaces.price_per_night, bookings.approval_status, bookings.availability_id FROM spaces JOIN bookings ON spaces.id  = bookings.space_id WHERE bookings.renter_user_id = #{user_id}")


    p bookings.first
  end

  def self.approve(id)
    return nil unless id

    result = DatabaseConnection.query(
      "UPDATE bookings
      SET approval_status = 'approved'
      WHERE id = '#{id}'
      RETURNING id, renter_user_id, space_id, availability_id, approval_status"
    )

    result = Booking.new(
      result[0]["id"],
      result[0]["renter_user_id"],
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
