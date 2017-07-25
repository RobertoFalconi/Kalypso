When(/^I go to lost password page$/) do
  visit restore_path
end
 
And(/^I write the asked info$/) do
  fill_in 'email', with: 'admin@kalypso.com'
  fill_in 'answer', with: 'la cipolla'
end

Then(/^I should be able to restore password$/) do
  click_button 'Save changes'
end