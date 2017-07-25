When(/^I go to about page$/) do
  visit about_path
end

Then(/^I should be able to read about$/) do
  page.has_content?("About Us")
end

