When(/^I go to about page$/) do
  visit root_path
end

Then(/^I should be able to read about$/) do
  assert page.has_content?("Welcome to Kalypso")
end

