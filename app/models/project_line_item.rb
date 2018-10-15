class ProjectLineItem < ApplicationRecord
  belongs_to :project

  enum status: {
    not_completed: 0,
    completed:     1
  }
end
