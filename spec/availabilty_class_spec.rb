require './lib/availability.rb'

describe 'Availability' do

  before(:each) do
    @date = Date.new
    @availability = Availability.create(1, @date)
  end

  it 'is an instance of Availablity' do
    expect(@availability).to be_an_instance_of(Availability)
  end
end
