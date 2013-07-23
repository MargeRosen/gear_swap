require 'spec_helper'
  before do
    project = Factory(:category, :title => "Keyboards")
    visit '/'
    click_link "Keyboards"
    click_link "New Listing"
  end

  feature 'Creating listings' do

    scenerio 'Creating a ticket' do
      fill_in "Title", :with => "2010 Yamaha Model ABC"
      fill_in "Description", :with => "A nice keyboard, lightly used."
      fill_in "Location", :with => "SLU, Seattle"
      fill_in "Price", :with => "$150"
      fill_in "Contact info", :with => "lister@gigswap.com"
      fill_in "Offsite links", :with => "mysite.com/keyboard_image"
      click_button "Create Listing"
      page.should have_content("Your listing has been posted.")
    end

  end
