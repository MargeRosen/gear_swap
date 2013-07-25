require 'spec_helper'

  feature "Viewing categories" do
    scenario "Listing all categories" do
      category = Factory.create(:category, :name => "Keyboards")
      visit '/'
      click_link 'Keyboards'
      page.current_url.should == category_url(category)
    end
  end
