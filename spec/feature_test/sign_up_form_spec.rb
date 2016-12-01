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

end
