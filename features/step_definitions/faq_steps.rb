When(/^I go to faq page$/) do
  visit faq_path
end

Then(/^I should be able to read faq$/) do
  page.has_content?("F.A.Q.")
end