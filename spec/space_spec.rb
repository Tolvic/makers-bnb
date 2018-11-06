require './lib/space.rb'

describe Space do

  before do
    @space = Space.create(user_id: 1,
      space_name: 'example',
      description: 'example description',
      price_per_night: 100
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
    expect(@space.user_id).to eq("1")
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
end
