rabbitmq_user "guest" do
	action :delete
end



node[:rabbitmq][:users].each do |user|


	rabbitmq_user user[:name] do
		password user[:password]
		action :add
	end


	if user[:tags]
		rabbitmq_user user[:name] do
			tags user[:tags]
			action :set_tags
		end
	end


	if user[:vhosts]
		user[:vhosts].each do |mq_vhost, mq_permissions|
			rabbitmq_user user[:name] do
				vhost mq_vhost
				permissions mq_permissions
				action :set_permissions
			end
		end
	end


end

