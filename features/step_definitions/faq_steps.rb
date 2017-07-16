When(/^I go to faq page$/) do
  visit root_path
end

Then(/^I should be able to read faq$/) do
  assert page.has_content?("Welcome to Kalypso")
end