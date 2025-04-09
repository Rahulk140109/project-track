require 'rails_helper'

RSpec.describe ProjectsController, type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  before { sign_in user, scope: :user }

  describe 'GET /projects' do
    it 'returns success' do
      get projects_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /projects/:id' do
    it 'returns success' do
      get project_path(project)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /projects/new' do
    it 'returns success' do
      get new_project_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /projects/:id/edit' do
    it 'returns success' do
      get edit_project_path(project)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /projects' do
    let(:project_params) do
      { project: attributes_for(:project) }
    end

    it 'creates a project and redirects' do
      expect(ProjectStatusTracker).to receive(:call).once

      expect {
        post projects_path, params: project_params
      }.to change(Project, :count).by(1)

      expect(response).to redirect_to(Project.last)
      follow_redirect!
      expect(response.body).to include("Project was successfully created.")
    end

    it 'renders new on failure' do
      post projects_path, params: { project: { title: '', description: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH /projects/:id' do
    it 'updates the project and calls status tracker when status changes' do
      allow(ProjectStatusTracker).to receive(:call)

      old_status = project.status
      patch project_path(project), params: { project: { status: 'draft' } }

      expect(response).to redirect_to(project_path(project))
      expect(ProjectStatusTracker).to have_received(:call).with(project, user, previous_status: old_status)
    end

    it 'does not call status tracker if status is unchanged' do
      allow(ProjectStatusTracker).to receive(:call)

      patch project_path(project), params: { project: { title: 'Updated Title' } }

      expect(ProjectStatusTracker).not_to have_received(:call)
    end

    it 'renders edit on failure' do
      patch project_path(project), params: { project: { title: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /projects/:id' do
    it 'destroys the project and redirects' do
      project # create project
      expect {
        delete project_path(project)
      }.to change(Project, :count).by(-1)

      expect(response).to redirect_to(projects_path)
    end
  end
end
