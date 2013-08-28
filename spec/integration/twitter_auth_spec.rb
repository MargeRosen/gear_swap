require 'spec_helper'

feature 'Twitter Auth' do
  before do
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new ({
      :provider => 'twitter',
      :uid => '12345',
      :info => { :nickname => 'A Twit (@twit)'}
      })
  end

  it "signing in with Twitter" do
    visit '/'
    click_link 'sign_in_with_twitter'
    page.should have_content("Signed in with Twitter!")
    page.should have_content("Signed in as A Twit (@twit)")
  end
end
