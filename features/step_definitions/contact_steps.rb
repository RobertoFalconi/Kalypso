When(/^I go to contact page$/) do
  visit root_path
end

Then(/^I should be able to use the form$/) do
  assert page.has_content?("Welcome to Kalypso")
end