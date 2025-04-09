
StatusChangeEvent.destroy_all
CommentEvent.destroy_all
ProjectEvent.destroy_all
Project.destroy_all
User.destroy_all
statuses = Project.statuses.keys
users = 5.times.map do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password123'
  )
end

projects = users.map do |user|
  Project.create!(
    title: Faker::App.name,
    description: Faker::Lorem.paragraph(sentence_count: 20),
    user: user,
    status: statuses.sample
  )
end

comment_events = 5.times.map do
  CommentEvent.create!(
    body: Faker::Lorem.paragraph(sentence_count: (0..6).to_a.sample),
    metadata: { created_by: Faker::Name.name }
  )
end

status_events = 5.times.map do
  from_status = statuses.sample
  to_status = (statuses - [ from_status ]).sample
  StatusChangeEvent.create!(
    from_status: from_status,
    to_status: to_status,
    metadata: { approved_by: Faker::Name.name }
  )
end

10.times do
  project = projects.sample
  user = users.sample
  if rand > 0.5
    eventable = comment_events.sample
  else
    eventable = status_events.sample
  end

  ProjectEvent.create!(
    project: project,
    user: user,
    eventable: eventable
  )
end
