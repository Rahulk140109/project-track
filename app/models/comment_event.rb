class CommentEvent < ApplicationRecord
  has_one :project_event, as: :eventable
end
