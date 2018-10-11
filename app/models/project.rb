class Project < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :main_objective

  enum status: {
    active:   0,
    archived: 1
  }

  def self.sort_by_last_updated
    order('updated_at DESC')
  end
end
