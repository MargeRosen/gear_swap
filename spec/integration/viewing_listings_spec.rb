require 'spec_helper'

  feature "Viewing listings" do
    before do
      # Get the category and it's listing"
      user = Factory(:user)
      category = Factory.create(:category, :name => "Keyboards")
      ticket = Factory(:listing,
            :category => category,
            :title => "Yamaha DX7",
            :description => "Vintage -- plays great!",
            :location => "Seattle, WA",
            :price => "400",
            :contact => "test@gmail.com",
            :pics => "pic 1")
      ticket.update_attribute(:user, user)


      category = Factory(:category, :name => "Trumpet")
      Factory(:listing,
            :category => category,
            :title => "Bach Strad 37 - 1978",
            :description => "Indiana.  All valves and slides work.",
            :location => "Lynwood, WA",
            :price => "1500",
            :contact => "test2@gmail.com",
            :pics => "pic 2")
      visit '/'
    end

    scenario "Viewing a listing for a category" do
      click_link "Keyboards"
      #page.current_url.should == category_url(category)
      page.should have_content("Yamaha DX7")
      page.should_not have_content("Indiana.  All valves and slides work.")

      click_link "Yamaha DX7"
      within("#listing h4") do
        page.should have_content("Vintage -- plays great!")
      end
      page.should have_content("Seattle, WA")
    end
  end
