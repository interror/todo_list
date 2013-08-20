
user = User.create(email: "john@john.john", password: "johnjohn", password_confirmation: "johnjohn")

3.times do |t|
	project = user.projects.create!(title: "Project number #{t}")
	5.times do |t|
		project.tasks.create(title: "Task number #{t} of #{project.title}")
	end
end

