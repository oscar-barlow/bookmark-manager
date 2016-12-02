def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :username, with: 'bryony@bryony.com'
  fill_in :password, with: 'Bryony'
  fill_in :password_confirmation, with: 'Bryony'
  click_button 'Submit'
end

def sign_up_with_mismatched_confirmation
  visit '/users/new'
  fill_in :username, with: 'bryony@bryony.com'
  fill_in :password, with: 'Bryony'
  fill_in :password_confirmation, with: 'Oscar'
  click_button('Submit')
end
