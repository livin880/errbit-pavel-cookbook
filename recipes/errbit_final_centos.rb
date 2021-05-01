#Installing dependencies
package "git"
#Clone Errbit form git Repo
git "/errbit/" do
     repository "https://github.com/errbit/errbit.git"
     action :sync
end
bash "change_dir" do
      code <<-EOF
      cd /usr/local/rvm
      sudo chmod -R a+w gems/
      cd /errbit/
      echo "gem 'bigdecimal', '1.3.5'" >> Gemfile
EOF
end

#Install Bundle and start Errbit listening on 0.0.0.0
bash "install_bundle_start_errbit" do
      code <<-EOF
      sudo chmod -R a+w /errbit
      cd /errbit/
      export PATH="/usr/local/rvm/rubies/ruby-2.7.0/bin:$PATH"
      bundle install
      sudo service mongod start
      bundle exec rake errbit:bootstrap
      bundle exec rails server -d -b 0.0.0.0
EOF
end

