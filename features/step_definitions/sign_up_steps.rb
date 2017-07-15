When(/^I go to the sign up page$/) do
  visit signup_path
end

Then(/^I should be able to sign up$/) do
  assert page.has_content?("Sign up")
end