node[:rabbitmq][:vhosts].each do |vhost|
	vhost_add vhost
end
