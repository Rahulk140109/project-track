require 'rails_helper'

RSpec.describe CommentEventsController, type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  before do
    sign_in user, scope: :user
  end

  describe "POST /projects/:project_id/comment_events" do
    it 'creates a comment and a project event' do
        expect {
          post project_comment_events_path(project),
               params: { comment_event: { body: 'Test comment' } },
               headers: { 'ACCEPT' => 'text/vnd.turbo-stream.html' }
        }.to change(CommentEvent, :count).by(1)
         .and change(ProjectEvent, :count).by(1)

        expect(response).to have_http_status(:ok)
      end
  end
end
