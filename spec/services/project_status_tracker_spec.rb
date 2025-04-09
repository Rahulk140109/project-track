require 'rails_helper'

RSpec.describe ProjectStatusTracker, type: :service do
  describe '.call' do
    let(:user) { create(:user) }
    let(:project) { create(:project, status: 'completed') }

    it 'creates a StatusChangeEvent and a ProjectEvent' do
      expect {
        ProjectStatusTracker.call(project, user, previous_status: 'draft')
      }.to change(StatusChangeEvent, :count).by(1)
       .and change(ProjectEvent, :count).by(1)

      status_event = StatusChangeEvent.last
      project_event = ProjectEvent.last

      expect(status_event.from_status).to eq('draft')
      expect(status_event.to_status).to eq('completed')
      expect(project_event.eventable).to eq(status_event)
      expect(project_event.user).to eq(user)
      expect(project_event.project).to eq(project)
    end
  end
end
