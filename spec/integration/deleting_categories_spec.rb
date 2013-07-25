require 'spec_helper'

feature "Deleting categories" do
  scenario "Deleting a category" do
    Factory(:category, :name => "Keyboards")
    visit '/'
    click_link "Keyboards"
    click_link "Delete Category"
    page.should have_content("Category has been deleted.")

    visit '/'
    page.should_not have_content("Keyboards")
  end
end
