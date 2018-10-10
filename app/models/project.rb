class Project < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :main_objective
end
