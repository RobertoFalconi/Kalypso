Given /^I go to suspended page$/ do
    visit login_path
    fill_in 'email', with: 'admin@kalypso.com'
    fill_in 'password', with: '12345678'
    click_button 'Login'
end

Then(/^I should be able to suspend the website$/) do
  visit login_path
  fill_in 'email', with: 'admin@kalypso.com'
  fill_in 'password', with: '12345678'
  click_button 'Login'
  visit specialoptions_path
  assert page.has_content?("Encrypt")
end

Then(/^I should be able to know the status of the app$/) do
  visit suspended_path
  assert !page.has_content?("Kalypso needs to rest")
end