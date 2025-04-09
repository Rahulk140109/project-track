class ProjectStatusTracker
  def self.call(project, user, previous_status: "")
    ActiveRecord::Base.transaction do
      event = StatusChangeEvent.create!(from_status: previous_status, to_status: project.status)
      project.project_events.create!(
        user: user,
        eventable: event
      )
    end
  end
end
