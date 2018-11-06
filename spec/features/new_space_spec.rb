feature 'FEATURE Listing a new space' do
  scenario 'Fill in form to list new space' do
    visit('/spaces/new')
    fill_in "user_id", with: 1
    fill_in "space_name", with: 'example'
    fill_in "description", with: 'example description'
    fill_in "price_per_night", with: 100
    click_button "submit"
    expect(page).to have_content 'example description'
  end
end
