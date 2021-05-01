execute 'download_publik_key' do
  command 'wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -'
end

package "gnupg"

execute 'redownload_publik_key' do
  command 'wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -'
end
file "/etc/apt/sources.list.d/mongodb-org-4.4.list" do
   content "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse"
end
execute 'apt-get update' do
  command 'sudo apt-get update'
end
package "mongodb-org"

execute 'add_to_autostart' do
 command 'systemctl enable mongod'
end
