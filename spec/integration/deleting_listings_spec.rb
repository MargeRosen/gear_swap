require 'spec_helper'

 feature "Deleting listing" do

  before do
    category = Factory(:category, :name => "Keyboards")
    @listing = Factory(:listing, :title => "Example listing")
    visit '/'
    click_link "Keyboards"
    click_link "Example listing"
    click_link "Delete Listing"
  end

  scenario "Deleting a listing" do
    page.should have_content("Listing has been deleted.")

    visit '/'
    page.should_not have_content("Example listing")
  end
end
