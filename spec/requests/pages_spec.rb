require 'spec_helper'

describe "Pages" do
  describe "Article page" do
    it "should have h1 with 'Article Example'" do
      visit '/article'
#      response.status.should be(200)
      page.should have_selector('h1', :text => 'Article Example')
    end
  end
end
