class BaseController < ApplicationController
	before_action :read_headers
	before_action :authenticate_user!

	def read_headers
		puts '----------------'
    puts request.headers['access-token']
    puts request.headers['client']
	end
end