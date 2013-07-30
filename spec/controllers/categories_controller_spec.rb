require 'spec_helper'

describe CategoriesController do
  it "displays an error for a missing category" do
    get :show, :id => "not-here"
    response.should redirect_to(categories_path)
    message = "The category you were looking for could not be found."
    flash[:alert].should == message
  end
end
