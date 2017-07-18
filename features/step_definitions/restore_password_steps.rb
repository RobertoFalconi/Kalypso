When(/^I go to lost password page$/) do
  visit restore_path
    fill_in 'email', with: 'admin@kalypso.com'
    fill_in 'answer', with: 'la cipolla'
    click_button 'Save changes'
end

Then(/^I should be able to restore password$/) do
  visit restore_path
  assert page.has_content?("Restore password")
end