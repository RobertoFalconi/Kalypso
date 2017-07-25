Given /^I go to login page$/ do
    visit login_path
end

And /^I write email and password$/ do
	fill_in 'email', with: 'admin@kalypso.com'
    fill_in 'password', with: '12345678'
end

Then /^I should be able to login$/ do
	click_button 'Login'
end

Then /^I should be able to logout$/ do
	@current_user
	
end