feature 'Listing a new space' do
  scenario 'Fill in form to list new space' do
    visit('/spaces/new')
    fill_in "User ID", with: 1
    fill_in "Space name", with: 'example'
    fill_in "Description", with: 'example description'
    fill_in "Price per night", with: 100
    click_button "Submit"
    expect(page).to have_content 'example description'
  end
end
