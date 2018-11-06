require 'user'
require 'database_helper'


describe User do
  before(:each) do
    @user = User.create(
      name: 'Donald',
      username: 'DDowg',
      telephone_number: '0755555555',
      email_address: 'DDowd@duckmail.com',
      password: 'IhatedaffyD123'
      )
  end

  describe "create method" do
    it "creates a new user" do
      persisted_data = persisted_data(table: 'users', id: @user.id)
      expect(@user).to be_a User
      expect(@user.id).to eq persisted_data['id']
      expect(@user.name).to eq 'Donald'
      expect(@user.telephone_number).to eq '0755555555'
      expect(@user.username).to eq 'DDowg'
      expect(@user.email_address).to eq 'DDowd@duckmail.com'
    end
  end

  describe '#already_registered?' do
   it 'returns true if account is already registered' do
     expect(User.already_registered?(email: 'DDowd@duckmail.com', username: 'cookiemonster', telephone_number: '0755555556')).to eq true

     expect(User.already_registered?(email: 'test@gmail.com', username: 'DDowg', telephone_number: '0755555556')).to eq true

     expect(User.already_registered?(email: 'test@gmail.com', username: 'cookiemonster', telephone_number: '0755555555')).to eq true
   end

    it 'returns false when account details have not been reqistered' do
    expect(User.already_registered?(email: 'test@gmail.com', username: 'cookiemonster', telephone_number: '0755555556')).to eq false
    end
  end
end
