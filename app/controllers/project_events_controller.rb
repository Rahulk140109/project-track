class ProjectEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  def index
    @project_events = @project.project_events.includes(:eventable, :user).order(created_at: :desc)
    respond_to do |format|
      format.js
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end
