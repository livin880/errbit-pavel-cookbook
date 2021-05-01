
case node['platform']
when 'centos'|| 'redhat'
# Call implementation recipe based on platform version
  include_recipe 'errbit::rubyenv_centos_redhat'
  include_recipe 'errbit::mongoDB_centos'
  include_recipe 'errbit::errbit_final_centos'

when 'ubuntu'
include_recipe 'errbit::rubyenv_ubuntu'
include_recipe 'errbit::mongoDB_ubuntu'
include_recipe 'errbit::errbit_final_ubuntu'
end
