require 'spec_helper'

  feature "Viewing categories" do
    let!(:user) {Factory(:confirmed_user)}
    let!(:category) {Factory(:category)}

    before do
      sign_in_as!(user)
      define_permission!(user, :view, category)
    end


    scenario "Viewing all categories" do
      visit '/'
      click_link category.name
      page.current_url.should == category_url(category)
    end

    scenario "Categories still appear even after 7 days" do
      Timecop.freeze(Date.today + 8) do
        visit '/'
        page.should have_content(category.name)
      end
    end
  end
