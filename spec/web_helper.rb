def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :username, with: 'bryony@bryony.com'
  fill_in :password, with: 'Bryony'
  click_button 'Submit'
end
