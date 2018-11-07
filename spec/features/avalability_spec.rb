feature 'FEATURE set availability' do
  scenario 'set availability' do
    visit('/spaces/new')
    fill_in 'space_name', with: 'example'
    fill_in 'description', with: 'example description'
    fill_in 'price_per_night', with: 100
    click_button 'submit'
    expect(page).to have_field("Date")
  end
end
# This doesnt work
