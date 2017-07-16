When(/^I go to newsletter page$/) do
  visit root_path
end

Then(/^I should be able to subscribe to mailing list$/) do
  assert page.has_content?("Welcome to Kalypso")
end