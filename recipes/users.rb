# rabbitmq_user "guest" do
# 	action :delete
# end



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
		user[:vhosts].each_key do |mq_vhost|
			rabbitmq_user user[:name] do
				vhost mq_vhost
				permissions user[:vhosts][mq_vhost]
				action :set_permissions
			end
		end
	end


end

