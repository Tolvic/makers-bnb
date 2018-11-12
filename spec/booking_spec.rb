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
      renter_user_id: @renter.id,
      availability_id: 1,
    )
  end

  describe '#create' do
    it 'creates a new booking request' do

      persisted_data = persisted_data(table: 'bookings', id: @booking.id)

      expect(@booking).to be_a Booking
      expect(@booking.id).to eq persisted_data['id']
      expect(@booking.space_id).to eq @space.id
      expect(@booking.renter_user_id).to eq @renter.id
      expect(@booking.availability_id).to eq '1'
    end
  end

  describe '#find' do
    it 'finds a user by ID' do
      @space2 = Space.create(user_id: @landlord.id,
        space_name: 'example',
        description: 'example description',
        price_per_night: 100
      )

      @renter2 = User.create(name: 'John',
      username: 'Terry',
      telephone_number: '07555555234',
      email_address: 'jterry@duckmail.com',
      password: 'IlovejterryT123')

      Booking.create(space_id: @space.id,
        renter_user_id: @renter2.id,
        availability_id: 1,
      )
      Booking.create(space_id: @space2.id,
        renter_user_id: @renter.id,
        availability_id: 1,
      )


      result = Booking.find(@space.id)

      expect(result.last).to be_a Booking
      expect(result.length).to eq 2
      expect(result.last.availability_id).to eq "1"
      expect(result.last.renter_user_id).to eq @renter2.id
      expect(result.last.space_id).to eq @space.id
      expect(result.last.approval_status).to eq "pending"
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '#approval' do
    it 'changes the status of a booking to approved' do
      @renter2 = User.create(name: 'John',
      username: 'Terry',
      telephone_number: '07555555234',
      email_address: 'jterry@duckmail.com',
      password: 'IlovejterryT123')

      @booking2 = Booking.create(space_id: @space.id,
        renter_user_id: @renter2.id,
        availability_id: 1,
      )

      @booking3 = Booking.create(space_id: @space.id,
        renter_user_id: @renter2.id,
        availability_id: 2,
      )

      Booking.approve(@booking.id)

      persisted_data1 = persisted_data(table: 'bookings', id: @booking.id)
      persisted_data2 = persisted_data(table: 'bookings', id: @booking2.id)
      persisted_data3 = persisted_data(table: 'bookings', id: @booking3.id)

      expect(persisted_data1["approval_status"]).to eq "approved"
      expect(persisted_data2["approval_status"]).to eq "declined"
      expect(persisted_data3["approval_status"]).to eq "pending"
    end
  end

  describe '#find_my_requests' do
    it "shows all requests I have made to book properties" do
      expect(Booking.find_my_requests(@renter.id)).to eq 1
    end
  end
end
