class ProjectLineItemSerializer < ActiveModel::Serializer
  attributes :id,
            :title,
            :description,
            :completed

  has_one :project
  has_many :check_list_items
end
