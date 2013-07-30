require 'spec_helper'

describe CategoriesController do
  let(:user) { Factory(:confirmed_user) }

  context "standard users" do
    before do
      sign_in(:user, user)
    end

    it "cannot access the new action" do
      get :new
      response.should redirect_to('/')
      flash[:alert].should == "You must be an admin to do that."
    end
  end

  it "displays an error for a missing category" do
    get :show, :id => "not-here"
    response.should redirect_to(categories_path)
    message = "The category you were looking for could not be found."
    flash[:alert].should == message
  end
end
