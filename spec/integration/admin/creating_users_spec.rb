require 'spec_helper'

feature "Creating Users" do
  let!(:admin) { Factory(:admin_user) }
  before do
    sign_in_as!(admin)
    visit '/'
    click_link "Admin lounge"
    click_link "Users"
    click_link "New User"
  end

  scenario 'Creating a new user' do
    fill_in "Email", :with => "newbie@example.com"
    fill_in "Password", :with => "password"
    fill_in "Username", :with => ""
    click_button "Create User"
    page.should have_content("User has been created.")
  end

  scenario "Leaving email blank results in an error" do
    fill_in "Email", :with => ""
    fill_in "Password", :with => "password"
    fill_in "Username", :with => ""
    click_button "Create User"
    page.should have_content("User has not been created.")
    page.should have_content("Email can't be blank")
  end

  scenario "Creating an admin user" do
    fill_in "Email", :with => "admin@example.com"
    fill_in "Password", :with => "password"
    fill_in "Username", :with => ""
    check "Is an admin?"
    click_button "Create User"
    page.should have_content("User has been created")
    within("#users") do
      page.should have_content("admin@example.com (Admin)")
    end
  end
end
