feature 'FEATURE space page' do
  scenario 'it has a button which redirects to listing a new space' do
    visit('/spaces')
    click_button 'List new space'
    expect(page).to have_content 'List new space'
  end
end
