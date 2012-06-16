#set :application, "mobile-osm-house-number-editor"

# Set the Rails environment
set :rails_env, "qastaging"

# Define environments for capistrano multistage
# (should be done before reuiring capistrano/ext/multistage)
#set :stages, %w( qastaging production )
#set :default_stage, "qastaging"

# See http://web-l.nl/posts/7-setting-up-a-rails-production-server-part-2
#require 'rvm/capistrano' # Add RVM integration
#require 'bundler/capistrano'  # Add Bundler integration
#require 'capistrano/ext/multistage' # Add multistage ability to capistrano

# RVM
#set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,"") # use the .rvmrc Ruby
#before 'deploy:setup', 'rvm:install_rvm'   # install RVM
#before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset

# Servers
#role :web, "92.243.9.243"
#role :app, "92.243.9.243"
#role :db,  "92.243.9.243", :primary => true

# Deploy from
#set :scm, :git
#set :repository,  "git@github.com:gonzalo-bulnes/mobile-osm-house-number-editor.git"
set :branch, "deployment"
# Use local personal SSH key (instead of server SSH keys)
# to acceed to the Github repository.
#ssh_options[:forward_agent] = true

# Deploy to
#set :user, "deploy"
set :deploy_to, "/var/www/#{application}"
#set :deploy_via, :remote_cache
#set :use_sudo, false

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are NOT using Passenger mod_rails comment this:
#namespace :deploy do
#  task :start do ; end
#  task :stop do ; end
#  task :restart, :roles => :app, :except => { :no_release => true } do
#    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#  end
#end

# Tail remote log files from local machine with: cap tail_logs
# See http://stackoverflow.com/questions/5218902/tail-production-log-with-capistrano-how-to-stop-it
#desc "tail production log files"
#task :tail_logs, :roles => :app do
#  run "tail -f #{shared_path}/log/production.log" do |channel, stream, data|
#    trap("INT") { puts 'Interupted'; exit 0; }
#    puts # for an extra line break before the host name
#    puts "#{channel[:host]}: #{data}"
#    break if stream == :err
#  end
#end
