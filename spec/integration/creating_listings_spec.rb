require 'spec_helper'

feature "Creating Listings" do

  before do
    Factory(:category, :name => 'Keyboards')
    user = Factory(:user, :email => "lister@gigswap.com")
    user.confirm!

    visit '/'
    click_link "Keyboards"
    click_link "New Listing"
    #page.should have_content("You need to sign in")

    fill_in "Email", :with => "lister@gigswap.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"
  end

  scenario "Creating a listing" do
    fill_in "Title", :with => "2010 Yamaha Model ABC"
    fill_in "Description", :with => "A nice keyboard, lightly used."
    fill_in "Location", :with => "SLU, Seattle"
    fill_in "Price", :with => "150"
    fill_in "Contact", :with => "lister@gigswap.com"
    click_button "Create Listing"
    page.should have_content("Your listing has been created.")
  end

  scenario "Creating a listing without valid attributes fails" do
    click_button "Create Listing"
    page.should have_content("Listing has not been created.")
    page.should have_content("Title can't be blank")
    page.should have_content("Description can't be blank")
  end

  scenario "Creating a ticket with an attachment", :js => true do
    fill_in "Title", :with => "2010 Yamaha Model ABC"
    fill_in "Description", :with => "A nice keyboard, lightly used."
    fill_in "Location", :with => "SLU, Seattle"
    fill_in "Price", :with => "150"
    fill_in "Contact", :with => "lister@gigswap.com"
    page.should have_content("Add a photo")
    click_link "Add a photo"
    sleep 5
    attach_file "File", "spec/fixtures/picture.png"
    click_link "Add a photo"
    attach_file "File", "spec/fixtures/picture2.jpeg"
    click_button "Create Listing"
    page.should have_content ("Your listing has been created.")
    #page.should have_content("picture.png")
    #page.should have_content("picture2.jpeg")
  end
end

