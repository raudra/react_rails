class UsersController < ApplicationController
	
	def index
		$current_user = 0.to_s
		@users = $redis.hgetall('user').select{|a| a != $current_user}.map{|key,val| p JSON.parse(val)}
	end

	def new_conv
		PublishMsg.new(params).exec
		render json: "200"
	end

	def convs
		r_key = RedisKey.new({user_id: params[:user_id]})
		data = $redis.hget(r_key.cov_key, r_key.channel_name)

		render json: data.present? ? JSON.parse(data): []
	end
	

end