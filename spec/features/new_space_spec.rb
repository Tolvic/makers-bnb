feature 'FEATURE Listing a new space' do
  scenario 'Fill in form to list new space' do
    @user = User.create(name: 'Donald',
      username: 'DDowg',
      telephone_number: '0755555555',
      email_address: 'DDowd@duckmail.com',
      password: 'password123')

    visit '/session/new'
    fill_in(:username, with: 'DDowg')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    click_button('List new space')
    fill_in "space_name", with: 'example'
    fill_in "description", with: 'example description'
    fill_in "price_per_night", with: 100
    click_button "submit"
    expect(page).to have_content 'please set an available date for property'
  end
end
