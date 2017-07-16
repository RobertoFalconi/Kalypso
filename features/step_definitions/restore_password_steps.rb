When(/^I go to lost password page$/) do
  visit root_path
end

Then(/^I should be able to restore password$/) do
  assert page.has_content?("Welcome to Kalypso")
end