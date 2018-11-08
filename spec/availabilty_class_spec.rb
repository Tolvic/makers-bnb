require './lib/availability.rb'

describe 'Availability' do

  before(:each) do
    @available_dates = Date.new(2014,1,17)
    @availability = Availability.create(1, @available_dates)
  end

  it 'is an instance of Availablity' do
    expect(@availability).to be_an_instance_of(Availability)
  end

  it 'we can call a space id from a availability' do
    expect(@availability.spaces_id).to eq "1"
  end

  it 'we can call an availible date from Availablity' do
    expect(@availability.available_dates).to eq('2014-01-17')
  end
end
