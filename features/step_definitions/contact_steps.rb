When(/^I go to contact page$/) do
  visit contacts_path
end

Then(/^I should be able to use the form$/) do
  page.has_content?("Contact Us")
end