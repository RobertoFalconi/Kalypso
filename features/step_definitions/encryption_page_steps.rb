When(/^I go to encryption page$/) do
  visit root_path
end

Then(/^I should be able to see how many characters left to be encrypted$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to decrypt a message$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to use a default encryption key$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to download the encrypted message in a text file$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to encrypt a message$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to see the weakness of my personal encryption key$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to download the generated QR Code$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to generate a QR Code with the encrypted message$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to transfer my encrypted message on my phone$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to upload the generated QR Code$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to set a time-out to a message to be decrypted$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to get tips about choosing a good encryption key$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to type an encryption key$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to encrypt unlimited characters$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to upload the encrypted message from a text file$/) do
  assert page.has_content?("Welcome to Kalypso")
end

