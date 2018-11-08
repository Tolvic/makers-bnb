feature 'FEATURE set availability' do
  scenario 'set availability' do
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
    fill_in "new_date", with: 10112018
    click_button "submit"
    click_button "See all spaces"
    expect(page).to have_content 'example description'
  end
end
