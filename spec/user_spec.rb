require 'user'
require 'database_helper'
describe User do
  describe "create method" do
    it "creates a new user" do
     @user = User.create(
      name: 'Donald',
      username: 'DDowg',
      telephone_number: '0755555555',
      email_address: 'DDowd@duckmail.com',
      password: 'IhatedaffyD123'
      )

      persisted_data = persisted_data(table: 'users', id: @user.id)

     expect(@user).to be_a User
     expect(@user.id).to eq persisted_data['id']
     expect(@user.name).to eq 'Donald'
     expect(@user.telephone_number).to eq '0755555555'
     expect(@user.username).to eq 'DDowg'
     expect(@user.email_address).to eq 'DDowd@duckmail.com'
    end

  end
end
