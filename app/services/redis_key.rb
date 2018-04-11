class RedisKey
	attr_accessor :args

	def initialize(args={})
		self.args= args
	end

	def year
		@years ||= Time.zone.now.strftime("%Y")
	end

	def month
		@month ||= Time.zone.now.strftime("%m")
	end

	def day
		@day ||= Time.zone.now.strftime("%d")
	end

	def channel_name
		str = $current_user.to_i > args[:user_id].to_i ? "#{args[:user_id].to_i}_#{$current_user}"  : "#{$current_user}_#{args[:user_id]}"
		"channel_#{str}"
	end

	def cov_key
		"#{year}-#{month}-#{day}"		
	end	

end