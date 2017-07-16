When(/^I go to sign up page$/) do
  visit root_path
end

Then(/^I should be able to sign up$/) do
  assert page.has_content?("Welcome to Kalypso")
end