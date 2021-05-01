package "git"
package "python"
user = node['current_user']
home = Dir.home(user)
git "#{home}/errbit/" do
repository "https://github.com/errbit/errbit.git"
action :sync
end
bash "change_dir" do
code <<-EOF
cd /usr/local/rvm
sudo chmod -R a+w gems/
cd #{home}/errbit/
echo "gem 'bigdecimal', '1.3.5'" >> Gemfile
EOF
end
#ENV['PATH']="/usr/local/rvm/rubies/ruby-2.7.0/bin:$PATH"
bash "install_bundle_start_errbit" do
code <<-EOF
cd #{home}/errbit/
export PATH="/usr/local/rvm/rubies/ruby-2.7.0/bin:$PATH"
bundle install
sudo service mongod start
bundle exec rake errbit:bootstrap
bundle exec rails server -d -b 0.0.0.0
rake db:seed
EOF
end




