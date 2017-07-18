Given /^I go to login page$/ do
    visit login_path
    fill_in 'email', with: 'provaprova@kalypso.com'
    fill_in 'password', with: '12345678'
    click_button 'Login'
end

Then /^I should be able to login$/ do
    user = User.find_by_name('Encrypt or decrypt')
end

Then /^I should be able to logout$/ do
    user = User.find_by_name('Log out')
end