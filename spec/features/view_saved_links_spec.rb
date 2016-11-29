require 'spec_helper'

RSpec.feature "View a link", :type=> :feature do

  scenario "View a list of links" do
    visit('/')
    expect(page).to have_text("Saved Links")
  end

end
