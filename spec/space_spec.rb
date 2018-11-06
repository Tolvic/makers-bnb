require './lib/space.rb'

describe Space do

  before do
    @space = Space.create(user_id: 1,
      space_name: 'example',
      description: 'example description')
  end

  it 'is an instance of Space' do
    expect(@space).to be_an_instance_of(Space)
  end

  it 'we can call a user id from a space' do
    expect(@space.user_id).to eq(1)
  end

  it 'we can call a space name from a space' do
    expect(@space.space_name).to eq('example')
  end

  it 'we can call a space description from a space' do
    expect(@space.description).to eq('example description')
  end
end
