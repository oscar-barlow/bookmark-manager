require 'spec_helper'
require 'web_helper'

feature 'sign up form' do
  scenario 'signs up a user' do
    visit '/users/new'
    expect(page).to have_content("Sign up form")
  end

  scenario 'user can enter their details' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, bryony@bryony.com')
    expect(User.first.username).to eq('bryony@bryony.com')
  end

  scenario 'confirmation fails if user enters mismatching password' do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username, with: 'bryony@bryony.com'
    fill_in :password, with: 'Bryony'
    fill_in :password_confirmation, with: 'Oscar'
    click_button('Submit')
    expect(User.count).to eq 0
  end

end
