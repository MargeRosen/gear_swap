require 'spec_helper'

  feature "Viewing categories" do
    scenario "Viewing all categories" do
      category = Factory.create(:category, :name => "Keyboards")
      visit '/'
      click_link category.name
      page.current_url.should == category_url(category)
    end
  end
