feature 'FEATURE space page' do
  scenario 'it has a button which redirects to listing a new space' do
    @user = User.create(name: 'Donald',
      username: 'DDowg',
      telephone_number: '0755555555',
      email_address: 'DDowd@duckmail.com',
      password: 'password123')

    visit '/session/new'
    fill_in(:username, with: 'DDowg')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    visit('/spaces')
    click_button 'List new space'
    expect(page).to have_content 'List new space'
  end
end
