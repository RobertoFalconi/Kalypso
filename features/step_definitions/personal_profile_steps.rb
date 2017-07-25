RSpec.shared_context 'When authenticated' do
  background do
    authenticate
  end

  def authenticate
    visit '/sessions/new'
    within('form#session') do
      fill_in 'email', :with => 'admin@kalypso.com'
      fill_in 'password', :with => '12345678'
    end
    click_button 'Login'
  end
end

When(/^I go to personal profile$/) do
  visit edittest_path
end

Then(/^I should be able to activate the website$/) do
  is_suspended
end

Then(/^I should be able to ban users$/) do
  click_button("ban")
end

Then(/^I should be able to modify account$/) do
  visit users_path
end

Then(/^I should be able to change my e-mail$/) do
  fill_in 'user_email', :with => 'newemail@example.com'
  click_button("Save changes")
end

Then(/^I should be able to change my password$/) do
  fill_in 'user_password', :with => 'newpassword'
  click_button("Save changes")
end

Then(/^I should be able to change my username$/) do
  fill_in 'user_name', :with => 'newname'
  click_button("Save changes")
end

Then(/^I should be able to delete my account$/) do
  click_button("Delete your account")
end

Then(/^I should be able to delete users$/) do
  click_button("Delete your account")
end

Then(/^I should be able to see my username in homepage$/) do
  page.has_content?(@user)
end

Then(/^I should be able to send newsletters$/) do
  visit subscribers_path
	page.has_content?("Send a newsletter")
end

Then(/^I should be able to view users account$/) do
  visit users_path
	page.has_content?("Users")
end

Then(/^I should be able to view every page of the web app$/) do
  visit users_path
	page.has_content?("Kalypso")
  visit root_path
	page.has_content?("Subscribe") #not accessible to logged in and non-admin users
  visit specialoptions_path
	page.has_content?("Suspend")
end