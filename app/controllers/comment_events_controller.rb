class CommentEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def create
    ActiveRecord::Base.transaction do
      comment = CommentEvent.create!(comment_params)
      @event = @project.project_events.create!(
        user: current_user,
        eventable: comment
      )
    end
  rescue ActiveRecord::RecordInvalid => e
    redirect_to project_path(@project), alert: "Failed to add comment: #{e.message}"
  end

  private

  def comment_params
    params.require(:comment_event).permit(:body)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
