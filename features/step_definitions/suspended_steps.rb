Given /^the admin logged in$/ do
	visit login_path
    fill_in 'email', with: 'admin@kalypso.com'
    fill_in 'password', with: '12345678'
    click_button 'Login'
end

When /^I go to suspended page$/ do
	visit specialoptions_path
end

Then(/^I should be able to suspend the website$/) do
	Site.first.suspended == true
end

Then(/^I should be able to know the status of the app$/) do
  Site.first.suspended?
end