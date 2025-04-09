class Project < ApplicationRecord
  belongs_to :user

  enum :status, {
    draft: "draft",
    pending: "pending",
    active: "active",
    archived: "archived",
    completed: "completed"
  }

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :status, presence: true
end
