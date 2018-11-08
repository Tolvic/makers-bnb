require './lib/booking'

describe User do
  before(:each) do
    @landlord = User.create(name: 'Donald',
    username: 'DDowg',
    telephone_number: '0755555555',
    email_address: 'DDowd@duckmail.com',
    password: 'IhatedaffyD123')

    @renter = User.create(name: 'Terry',
    username: 'Bag',
    telephone_number: '0755555553',
    email_address: 'terry@duckmail.com',
    password: 'IloveterryT123')

    @space = Space.create(user_id: @landlord.id,
      space_name: 'example',
      description: 'example description',
      price_per_night: 100
    )

    @booking = Booking.create(space_id: @space.id,
      user_id: @renter.id,
      availability_id: 1,
    )
  end

  describe '#create' do
    it 'creates a new booking request' do

      persisted_data = persisted_data(table: 'bookings', id: @booking.id)

      expect(@booking).to be_a Booking
      expect(@booking.id).to eq persisted_data['id']
      expect(@booking.space_id).to eq @space.id
      expect(@booking.user_id).to eq @renter.id
      expect(@booking.availability_id).to eq '1'
    end
  end
end
