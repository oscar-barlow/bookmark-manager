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

  scenario 'user is not created if user enters mismatching password' do
    sign_up_with_mismatched_confirmation
    expect{sign_up_with_mismatched_confirmation}.not_to change(User, :count)
  end

  scenario 'stay on same page when user enters mismatching password' do
    sign_up_with_mismatched_confirmation
    expect(page).to have_current_path('/users')
  end

  scenario 'page shows error message if mismatched password entered' do
    sign_up_with_mismatched_confirmation
    expect(page).to have_content("Password and confirmation password do not match")
  end

end
