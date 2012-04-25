require 'spec_helper'

describe "Static pages" do

  describe "Code page" do

    it "should have the content 'StaticPages#code'" do
      visit '/static_pages/code'
      page.should have_content('StaticPages#code')
    end
  end
end
