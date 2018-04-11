class PublishMsg
	attr_accessor :args
	
	def initialize(args)
		self.args = args
		@r_key = RedisKey.new({user_id: args[:chat_user]})
	end

	def exec
		if args[:new_con].present?
			data = {
							msg: args[:new_con],
							from: $current_user,
							to: args[:chat_user],
							data: Time.now
							}.to_json
			$redis.publish "#{@r_key.channel_name}", data
			upsert_msg_to_redis
		end	
	end


	def upsert_msg_to_redis
		daily_cons = $redis.hget(@r_key.cov_key, @r_key.channel_name)
		if daily_cons.present?
			daily_cons = JSON.parse(daily_cons)
		else
			daily_cons = Array.new
		end
		daily_cons <<  {
										to: args[:chat_user],  
										msg: args[:new_con],
										id: "#{@r_key.channel_name}-#{daily_cons.count+1}"
									 }
		$redis.hset(@r_key.cov_key, @r_key.channel_name, daily_cons.to_json)
	end

	
end