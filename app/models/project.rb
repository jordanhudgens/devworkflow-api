class Project < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :main_objective

  enum status: {
    active:   0,
    archived: 1
  }
end
