require 'spec_helper'

describe "Pages" do
  describe "Article page" do
    before { visit article_path }

    it { page.should have_selector('h1', :text => 'Article Example') }
    pending "should have basic structure" do
      page.should have_selector('nav')
      page.should have_selector('article')
      page.should have_selector('footer')
    end
    pending { page.should have_selector('aside.tags') }
  end
end
