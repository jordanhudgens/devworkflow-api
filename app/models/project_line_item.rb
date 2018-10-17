class ProjectLineItem < ApplicationRecord
  belongs_to :project

  has_many :check_list_items, dependent: :destroy

  accepts_nested_attributes_for :check_list_items,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs[:title].blank? }
end
