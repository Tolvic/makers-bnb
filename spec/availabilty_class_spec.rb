require './lib/availability.rb'

describe 'Availability' do

  before(:each) do
    @available_dates = Date.new(2014,1,17)
    @available_dates2 = Date.new(2018,1,18)
    @availability = Availability.create(1, @available_dates)
    @availability2 = Availability.create(2, @available_dates2)
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

  it 'output all availible dates' do
      # Availability.create(1, @available_dates
      # )
      # Availability.create(2, @available_dates2
      # )

      all_available = Availability.all(@availability2.spaces_id)

      expect(all_available[1].available_dates).to eq "2018-01-18"
  end
end
