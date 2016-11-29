require 'spec_helper'

  RSpec.feature "Add a link", :type=> :feature do

    scenario "Add a link" do
      visit('/links/new')
      fill_in('Title', with: 'The Guardian')
      fill_in('URL', with: 'www.theguardian.com/uk')
      click_button('Add Link')

      within 'ul#links' do
        expect(page).to have_content('The Guardian')
      end

    end

  end
