feature 'FEATURE - User story 1 - I want to be able to sign up for Makers bnb' do
  scenario 'A user can sign up' do
    visit '/user/new'
    fill_in('name', with: 'Donald Duck')
    fill_in('username', with: 'D.Dowg')
    fill_in('telephone_number', with: '07555555555')
    fill_in('email_address', with: 'D.Dowg@duckmail.com')
    fill_in('password', with: 'IhatedaffyD123')
    click_button('submit')

    expect(page).to have_content('Welcome, D.Dowg')
  end

  scenario 'A user cannot signup with credentials aready used to sign up an account' do
      visit '/user/new'
      fill_in('name', with: 'Donald')
      fill_in('username', with: 'D.Dowg')
      fill_in('telephone_number', with: '07555555555')
      fill_in('email_address', with: 'D.Dowg@duckmail.com')
      fill_in('password', with: 'IhatedaffyD123')
      click_button('submit')

      visit '/user/new'
      fill_in('name', with: 'Donald')
      fill_in('username', with: 'D.Dowg')
      fill_in('telephone_number', with: '07555555555')
      fill_in('email_address', with: 'D.Dowg@duckmail.com')
      fill_in('password', with: 'IhatedaffyD123')
      click_button('submit')


      expect(page).to have_content('Credentials have already been used by another user.')
      # expect(page).not_to have_content('Welcome, D.Dowg')

  end
end
