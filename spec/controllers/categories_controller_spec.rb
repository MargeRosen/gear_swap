require 'spec_helper'

describe CategoriesController do
  let(:user) { Factory(:confirmed_user) }
  let(:category) { mock_model(Category, :id => 1) }

  context "standard users" do
    before do
      sign_in(:user, user)
    end

   { :new => :get,
      :create => :post,
      :edit => :get,
      :update => :put,
      :destroy => :delete }.each do |action, method|
        it "cannot access the #{action} action" do
          sign_in(:user, user)
          send(method, action, :id => category.id)
          response.should redirect_to(root_path)
          flash[:alert].should eql("You must be an admin to do that.")
        end
      end


    it "displays an error for a missing category" do
      get :show, :id => "not-here"
      response.should redirect_to(categories_path)
      message = "The category you were looking for could not be found."
      flash[:alert].should == message
    end
  end
end
