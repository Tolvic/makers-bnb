feature 'Feature - authentication' do
  before(:each) do
    @user = User.create(name: 'Donald',
      username: 'DDowg',
      telephone_number: '0755555555',
      email_address: 'DDowd@duckmail.com',
      password: 'password123')
  end

  it 'a user can sign in' do
    visit '/session/new'
    fill_in(:username, with: 'DDowg')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, DDowg'
  end

  scenario 'a user sees an error if they get their email wrong' do
    visit '/session/new'
    fill_in(:username, with: 'anotherusername')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, DDowg'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    visit '/session/new'
    fill_in(:username, with: 'DDowg')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, DDowg'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can sign out' do
    visit '/session/new'
    fill_in(:username, with: 'DDowg')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, DDowg'
    expect(page).to have_content 'You have signed out.'
  end
end
