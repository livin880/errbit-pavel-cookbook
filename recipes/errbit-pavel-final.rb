
case node['platform']
when 'centos'|| 'redhat'
# Call implementation recipe based on platform version
  include_recipe 'errbit-pavel-cookbook::rubyenv_centos_redhat'
  include_recipe 'errbit-pavel-cookbook::mongoDB_centos'
  include_recipe 'errbit-pavel-cookbook::errbit_final_centos'

when 'ubuntu'
include_recipe 'errbit-pavel-cookbook::rubyenv_ubuntu'
include_recipe 'errbit-pavel-cookbook::mongoDB_ubuntu'
include_recipe 'errbit-pavel-cookbook::errbit_final_ubuntu'
end
