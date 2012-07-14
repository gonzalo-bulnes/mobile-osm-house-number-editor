class StaticPagesController < ApplicationController
  def about
  end

  def help
  end

  def robots
    # http://timbabwe.com/2011/08/rails-robots-txt-customized-by-environment-automatically
    robots = File.read(Rails.root + "config/robots.#{Rails.env}.txt")
    render :text => robots, :layout => false, :content_type => "text/plain"
  end

  def signin
  end
end
