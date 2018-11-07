require 'user'
require 'database_helper'

describe User do
  before(:each) do
    @user = User.create(name: 'Donald',
    username: 'DDowg',
    telephone_number: '0755555555',
    email_address: 'DDowd@duckmail.com',
    password: 'IhatedaffyD123')
  end

  describe '#create' do
    it 'creates a new user' do

      persisted_data = persisted_data(table: 'users', id: @user.id)

      expect(@user).to be_a User
      expect(@user.id).to eq persisted_data['id']
      expect(@user.name).to eq 'Donald'
      expect(@user.username).to eq 'DDowg'
      expect(@user.telephone_number).to eq '0755555555'
      expect(@user.email_address).to eq 'DDowd@duckmail.com'
    end
  end

  describe '#find' do
    it 'finds a user by ID' do

      result = User.find(@user.id)

      expect(result.id).to eq @user.id
      expect(result.name).to eq @user.name
      expect(result.username).to eq @user.username
      expect(result.telephone_number).to eq @user.telephone_number
      expect(result.email_address).to eq @user.email_address
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '#authenticate' do
    it 'returns nil given an incorrect email address' do
      expect(User.authenticate(email_address: 'nottherightemail@me.com', password: 'IhatedaffyD123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      expect(User.authenticate(email_address: 'DDowd@duckmail.com', password: 'wrongpassword')).to be_nil
    end

    it 'returns a user given a correct username and password, if one exists' do

      authenticated_user = User.authenticate(email_address: 'DDowd@duckmail.com', password: 'IhatedaffyD123')

      expect(authenticated_user.id).to eq @user.id
    end
  end

  describe '#already_registered?' do
   it 'returns true if account is already registered' do
     expect(User.already_registered?(email_address: 'DDowd@duckmail.com', username: 'cookiemonster', telephone_number: '0755555556')).to eq true

     expect(User.already_registered?(email_address: 'test@gmail.com', username: 'DDowg', telephone_number: '0755555556')).to eq true

     expect(User.already_registered?(email_address: 'test@gmail.com', username: 'cookiemonster', telephone_number: '0755555555')).to eq true
   end

    it 'returns false when account details have not been reqistered' do
    expect(User.already_registered?(email_address: 'test@gmail.com', username: 'cookiemonster', telephone_number: '0755555556')).to eq false
    end
  end
end
