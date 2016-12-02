def sign_up(email, password, password_confirmation)
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :username, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Submit'
end
