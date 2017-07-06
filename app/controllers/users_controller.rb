class UsersController < BaseController
  expose(:users) { User.all }

	def index
		render status: 200, json: users
	end
end