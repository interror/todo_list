Project.destroy_all
3.times do |t|
	p = Project.create!(title: "Project number #{t}")
	5.times do |t|
		p.tasks.create(title: "Task number #{t} of #{p.title}")
	end
end

