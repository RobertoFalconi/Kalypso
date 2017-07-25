When(/^I go to encryption page$/) do
	visit messages_path
end

And(/^I type something$/) do
  fill_in 'inputTextToSave', with: 'ciao'
end

And(/^I write a personal encryption key$/) do
  fill_in 'password', with: 'ciao'
end
	
And(/^I type an encrypted mess$/) do
  fill_in 'inputTextToSave', with: '{"v":1,"adata":"","ks":256,"ct":"QfwcgAWnBtnmHtuBkZjOehaPTvg07ATVMLL+FlnHfpc=","ts":96,"mode":"gcm","cipher":"aes","iter":100000,"iv":"mzS/4QRzaQigUb5E","salt":"Q2m+qChbnss="}'
end

And(/^I click Encrypt$/) do
  click_button("Encrypt message")
end

And(/^I click Decrypt$/) do
  click_button("Decrypt message")
end

Then(/^I should be able to see how many characters left to be encrypted$/) do
  assert page.has_content?("Chars left:15")
end

Then(/^I should be able to use a default encryption key$/) do
  assert page.has_content?("Odysseus")
  assert page.has_content?("Homer")
  assert page.has_content?("Atlas")
  assert page.has_content?("Pleione")
end

Then(/^I should be able to decrypt a message$/) do
  assert page.has_content?("Il tuo messaggio criptato è:")
end

Then(/^I should be able to download the encrypted message in a text file$/) do
  click_button("Save Text to File")
end

Then(/^I should be able to encrypt a message$/) do
  assert page.has_content?("Il tuo messaggio criptato è:")
end

Then(/^I should be able to download the generated QR Code$/) do
  click_button("Download QR Code!")
end

Then(/^I should be able to generate a QR Code with the encrypted message$/) do
  assert page.has_content?("QR Code")
end

Then(/^I should be able to transfer my encrypted message on my phone$/) do
  assert page.has_content?("QR Code")
end

Then(/^I should be able to upload the generated QR Code$/) do
  click_button("Read QR code")
end

Then(/^I should be able to set a time-out to a message to be decrypted$/) do
  assert page.has_content?("Timeout")
end

Then(/^I should be able to get tips about choosing a good encryption key$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to type an encryption key$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to see the weakness of my personal encryption key$/) do
  assert page.has_content?("Welcome to Kalypso")
end

Then(/^I should be able to encrypt unlimited characters$/) do
  assert !page.has_content?("Chars left: 15")
end

Then(/^I should be able to upload the encrypted message from a text file$/) do
  click_button("Load Selected File")
end

