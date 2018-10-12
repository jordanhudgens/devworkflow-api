class Project < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :main_objective
  validates :main_objective, length: { maximum: 130 }
  validates :title, length: { maximum: 55 }

  has_many :project_line_items, dependent: :destroy

  enum status: {
    active:   0,
    archived: 1
  }

  def self.sort_by_last_updated
    order('updated_at DESC')
  end
end
