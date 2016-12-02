require 'spec_helper'
require 'web_helper'

feature 'sign up form' do
  scenario 'signs up a user' do
    visit '/users/new'
    expect(page).to have_content("Sign up form")
  end

  scenario 'user can enter their details' do
    expect {sign_up('bryony@bryony.com', 'Bryony', 'Bryony')}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, bryony@bryony.com')
    expect(User.first.username).to eq('bryony@bryony.com')
  end

  scenario 'user is not created if user enters mismatching password' do
    expect{sign_up('bryony@bryony.com', 'Bryony', 'Oscar')}.not_to change(User, :count)
  end

  scenario 'stay on same page when user enters mismatching password' do
    sign_up('bryony@bryony.com', 'Bryony', 'Oscar')
    expect(page).to have_current_path('/users')
  end

  scenario 'page shows error message if mismatched password entered' do
    sign_up('bryony@bryony.com', 'Bryony', 'Oscar')
    expect(page).to have_content("Password and confirmation password do not match")
  end

  scenario 'user is not created if user does not enter an email address' do
    expect{sign_up('', 'Bryony', 'Bryony')}.not_to change(User, :count)
    print User.count
  end

  scenario 'user cannot sign up if email has an invalid format' do
    expect{sign_up('bryony.com', 'Bryony', 'Bryony')}.not_to change(User, :count)
  end

end
