require 'spec_helper'

feature "Seed Data" do
  scenario "The basics" do
    load Rails.root + "db/seeds.rb"
    user = User.find_by_email!("admin@gearswap.com")
    sign_in_as!(user)
    page.should have_content("Saxophones")
  end

  scenario "new user" do
    load Rails.root + "db/seeds.rb"
    user = User.find_by_email!("test1@example.com")
    sign_in_as!(user)
    page.should have_content("Saxophones")
  end
end
