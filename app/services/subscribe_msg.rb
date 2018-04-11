require 'rubygems'
require 'redis'
require 'json'
		
class SubscribeMsg
	attr_accessor :args, :user
	
	def initialize(args)
		$redis = Redis.new
		@args  = args
		@user = $redis.hgetall('user')
	end

	def exec
		$redis.subscribe(args[:channel]) do |on|
		   on.subscribe do |channel, subscriptions|
		   end
		   on.message do |channel, msg|
		      data = JSON.parse(msg)
		      puts "[#{@user[data['user'].to_s]}]: #{data['msg']}"
		   end
		end
	end	
end

SubscribeMsg.new({channel: "channel_0_12"}).exec
