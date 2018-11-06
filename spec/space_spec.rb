require './lib/space.rb'

describe Space do

  before do
    @user = User.create(
     name: 'Donald',
     username: 'DDowg',
     telephone_number: '0755555555',
     email_address: 'DDowd@duckmail.com',
     password: 'IhatedaffyD123'
     )

    @space = Space.create(user_id: @user.id,
      space_name: 'example',
      description: 'example description',
      price_per_night: 100
    )

    @user2 = User.create(
    name: 'Terry',
    username: 'TBag',
    telephone_number: '0755555554',
    email_address: 'TBag@duckmail.com',
    password: 'IhateTerry'
    )

    @user3 = User.create(
    name: 'Moishe',
    username: 'MDude',
    telephone_number: '0755555557',
    email_address: 'MDude@duckmail.com',
    password: 'IhateMoishe'
    )
  end

  it 'is an instance of Space' do
    expect(@space).to be_an_instance_of(Space)
  end

  it 'we can call a space id from a space' do
    persisted_data = DatabaseConnection.query("SELECT * FROM spaces WHERE id = #{@space.id}")[0]
    expect(@space.id).to eq persisted_data['id']
  end

  it 'we can call a user id from a space' do
    expect(@space.user_id).to eq("#{@user.id}")
  end

  it 'we can call a space name from a space' do
    expect(@space.space_name).to eq('example')
  end

  it 'we can call a space description from a space' do
    expect(@space.description).to eq('example description')
  end

  it 'we can call a space price_per_night from a space' do
    expect(@space.price_per_night).to eq("100")
  end

  it 'output all spaces' do
      Space.create(user_id: @user2.id,
        space_name: 'example2',
        description: 'example description2',
        price_per_night: 1002
      )
      Space.create(user_id: @user3.id,
        space_name: 'example3',
        description: 'example description3',
        price_per_night: 1003
      )

      all_spaces = Space.all

      expect(all_spaces[2].price_per_night).to eq "1003"
  end
end
