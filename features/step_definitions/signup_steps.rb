Given /^I go to sign up page$/ do
    visit signup_path
    fill_in 'name', with: 'provacucumber'
    fill_in 'email', with: 'provaprova@kalypso.com'
    fill_in 'password', with: '12345678'
    fill_in 'password_confirmation', with: '12345678'
    fill_in 'answer', with: '12345678'
    click_button 'Create my account'
end

Then /^I should be able to sign up$/ do
    user = User.find_by_name('provacucumber')
end