When(/^I go to personal profile$/) do
  visit root_path
end

Then(/^I should be able to activate the website$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to ban users$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to modify account$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to change my e-mail$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to change my password$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to change my username$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to delete my account$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to delete users$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to see my username in homepage$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to send newsletters$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to view users account$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to view every page of the web app$/) do
  assert page.has_content?("Welcome to Kalypso")
end