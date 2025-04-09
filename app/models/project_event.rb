class ProjectEvent < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :eventable, polymorphic: true
end
