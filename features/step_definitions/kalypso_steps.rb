When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see the welcome message$/) do
  assert page.has_content?("Welcome to Kalypso")
end

