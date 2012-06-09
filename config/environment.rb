# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Mobileosmhousenumbereditor::Application.initialize!

# Get a revision number to display if required
# See http://blog.danielpietzsch.com/post/1209091430/show-the-version-number-of-your-rails-app-using-git
APP_VERSION = `git describe --always` unless defined? APP_VERSION
