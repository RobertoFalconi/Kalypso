When(/^I go to login page$/) do
  visit root_path
end

Then(/^I should be able to login$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to logout$/) do
  assert page.has_content?("Welcome to Kalypso")
end