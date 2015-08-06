case node['platform']
when "centos"
  default['dns_cache']['package']="ndjbdns"
  default['dns_cache']['conf_dir']="/etc/ndjbdns"
when "ubuntu"
  default['dns_cache']['package']="djbdns"
end

default['dns_cache']['subnets_allowed']=["10","192","172"]
default['dns_cache']['roots']=["8.8.8.8","8.8.4.4"]

