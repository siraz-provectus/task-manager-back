User.create(email: 'user@example.com', nickname: 'UOne', name: 'User One', password: "monkey67")

3.times do |n|
	Task.create!(title: "Task number #{n+1}", description: "New test task #{n+1}", reporter: User.find_by(email: 'user@example.com'))
end

2.times do |n|
	Task.create!(title: "Task in process number #{n+1}", description: "Test task in progress N #{n+1}", reporter: User.find_by(email: 'user@example.com'), implementer: User.find_by(email: 'user@example.com'), employer: User.find_by(email: 'user@example.com'), status: 'in_process')
end


Task.create!(title: "Task Complete", description: "Test task with status resolved", reporter: User.find_by(email: 'user@example.com'), implementer: User.find_by(email: 'user@example.com'), employer: User.find_by(email: 'user@example.com'), status: 'resolved', rating: 5)