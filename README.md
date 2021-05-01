# errbit-pavel-cookbook

  This cookbook is designed to provision server/VM by installing Ruby and Rails, mongoDB and to install errbit.

# Supported Platforms
- CentOS  
- Red-Hat  
- Ubuntu  
- Debian 

# The list of Requirements to install Errbit using provide recipes

* Non-root sudo user on the node where will be installed Errbit  
* Network reachability between chefworkstation, chefserver, chefnode  
* Allowed in iptables/Firewalld connection toward port 3000 on chefnode where will be installed errbit  

# Installation

1.Clone on chefworkstation in the directory with cookbooks this repo:      

git clone https://github.com/livin880/errbit-pavel-cookbook.git  

2.Upload cookbook on Chef-Server From the directory where are stored all cookbooks         

knife upload cookbook errbit-pavel-cookbook  

3.Add in runlist of chefnode the recipe errbit-pavel-final.rb  

knife node run_list add chefnode 'recipe[errbit-pavel-cookbook::errbit-pavel-final]'

*replace chefnode by hostname of your node where should be installed errbit




