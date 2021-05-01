#Recipe was created based on https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/
#Adding repo

file "/etc/yum.repos.d/mongodb-org-4.4.repo" do
   content "[mongodb-org-4.4]\nname=MongoDB Repository\nbaseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.4/x86_64/\ngpgcheck=1\nenabled=1\ngpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc"
end

#Execute yum update
execute 'yum_update' do
  command 'yum update -y'
end

#Install MongoDB
package "mongodb-org"

#Adding MongoDB in autostart
execute 'add_to_autostart' do
 command 'systemctl enable mongod'
end
