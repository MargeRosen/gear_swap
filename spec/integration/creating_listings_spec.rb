require 'spec_helper'

feature "Creating Listings" do

  before do
    category = Factory(:category, :name => 'Keyboards')
    visit '/'
    click_link "Keyboards"
    click_link "New Listing"
  end

  scenario "Creating a listing" do
    fill_in "Title", :with => "2010 Yamaha Model ABC"
    fill_in "Description", :with => "A nice keyboard, lightly used."
    fill_in "Location", :with => "SLU, Seattle"
    fill_in "Price", :with => "150"
    fill_in "Contact", :with => "lister@gigswap.com"
    fill_in "Pics", :with => "mysite.com/keyboard_image"
    click_button "Create Listing"
    page.should have_content("Your listing has been created.")
  end

  scenario "Creating a listing without valid attributes fails" do
    click_button "Create Listing"
    page.should have_content("Listing has not been created.")
    page.should have_content("Title can't be blank")
    page.should have_content("Description can't be blank")
  end
end

