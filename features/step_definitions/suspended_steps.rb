When(/^I go to suspended page$/) do
  visit root_path
end

Then(/^I should be able to suspend the website$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to know the status of the app$/) do
  assert page.has_content?("Welcome to Kalypso")
end