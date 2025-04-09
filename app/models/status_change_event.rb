class StatusChangeEvent < ApplicationRecord
  has_one :project_event, as: :eventable
end
