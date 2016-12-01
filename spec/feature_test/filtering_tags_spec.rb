require 'spec_helper'

feature 'filtering tags' do

  scenario 'only links tagged with bubbles are present' do
    visit '/links/new'
    fill_in 'title', with: 'This is Bing'
    fill_in 'url', with: 'https://www.bing.com'
    fill_in 'name', with: 'Bing'
    click_button 'Create new link'
    click_button 'Create new link'
    fill_in 'title', with: 'This is Bubbles'
    fill_in 'url', with: 'www.bubbles.com'
    fill_in 'name', with: 'Bubbles'
    click_button 'Create new link'
    visit '/tags/bubbles'
    expect(page).to have_content('Bubbles')
    expect(page).to_not have_content('Bing')
  end

end
