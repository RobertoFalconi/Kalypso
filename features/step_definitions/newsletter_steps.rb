When(/^I go to newsletter page$/) do
  visit subscribers_path
end

Then(/^I should be able to subscribe to mailing list$/) do
  page.has_content?("newsletter")
end