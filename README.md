# errbit-pavel-cookbook

  This cookbook is designed to provision server/VM by installing Ruby and Rails, mongoDB and to install errbit.

# Supported Platforms
- Ubuntu    
- CentOS    
- RedHat   
- Debian 

# Description of recipes contained in cookbook
- recipe[errbit-pavel-cookbook::rubyenv_ubuntu] - recipe to install Ruby and Rails on Ubuntu/Debian  
- recipe[errbit-pavel-cookbook::mongoDB_ubuntu] - recipe to install MongoDB on Ubuntu/Debian  
- recipe[errbit-pavel-cookbook::errbit_final_ubuntu] - recipe to install and start Errbit on Ubuntu/Debian  
- recipe[errbit-pavel-cookbook::rubyenv_centos_redhat] - recipe to install Ruby and Rails on CentOS/RedHat  
- recipe[errbit-pavel-cookbook::mongoDB_centos] - recipe to install MongoDB on CentOS/RedHat  
- recipe[errbit-pavel-cookbook::errbit_final_centos] - recipe to install and start Errbit on CentOS/RedHat  
- recipe[errbit-pavel-cookbook::errbit-pavel-final] - recipe to install Errbit on any platform(it include corresponding recipes depending of platform from cookbook)  

# The list of Requirements to install Errbit using provided recipes

* Non-root sudo user on the node where will be installed Errbit  
* Network reachability between chefworkstation, chefserver, chefnode  
* Allowed in iptables/Firewalld connection toward port 3000 on chefnode where will be installed errbit  

# Installation and starting Errbit

1.Clone on chefworkstation in the directory with cookbooks this repo:      


  #### git clone https://github.com/livin880/errbit-pavel-cookbook.git 

    

2.Upload cookbook on Chef-Server From the directory where are stored all cookbooks:           


  #### knife upload cookbook errbit-pavel-cookbook  


3.Botstrap new node where should be installed Errbit:  


  #### knife bootstrap IP_address* -x username* -P password* --sudo --use-sudo-password -y --connection-password sudopassword* --node-name hostname*


**Please note that IP_address, username,password,sudopassword,hostname should be replaced by your for node where will be priovisioned Errbit* 


4.Add in run-list of chefnode the recipe errbit-pavel-final.rb:   


  #### knife node run_list add hostname* 'recipe[errbit-pavel-cookbook::errbit-pavel-final]'


**Replace chefnode by hostname of your node where should be installed errbit*

5.Run recipe added in run-list for node:    

  #### knife ssh name:hostname* -x username* -P password* "sudo chef-client"  
  
  **Please be patient recipe execution can take some time untill will be finished*
  
  
6.Once Chef-infra client finished, login with user which was used to run recipe on node where Errbit was installed and retrieve password for first access execute command:  

#### rake db:seed

7.Copy email and password from point 6 and open in browser http://IP_address:3000

**Replace IP_address by IP of node where was installed Errbit*


# Tested on Platforms

* Ubuntu 18.04 LTS
* CentOS Linux Release 8.3.2011
* Oracle VirtualBox 5.2.44

# Author  
Pavel Bognibov



