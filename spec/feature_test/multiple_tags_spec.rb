require 'spec_helper'

feature 'Adding multiple tags to a website' do

  scenario "write multiple tags" do
    visit '/links'
    click_button 'Create new link'
    fill_in 'title', with: 'This is Bing'
    fill_in 'url', with: 'https://www.bing.com'
    fill_in 'name', with: 'bing, windows, search, evil'
    click_button 'Create new link'
    expect(page).to have_content('bing')
    expect(page).to have_content('windows')
    expect(page).to have_content('search')
    expect(page).to have_content('evil')

  end


end
