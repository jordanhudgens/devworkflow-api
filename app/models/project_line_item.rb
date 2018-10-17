class ProjectLineItem < ApplicationRecord
  belongs_to :project

  has_many :check_list_items, dependent: :destroy
end
