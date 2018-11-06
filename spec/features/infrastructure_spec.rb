feature 'Testing infrastructure' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content('Makers BnB')
  end
end
