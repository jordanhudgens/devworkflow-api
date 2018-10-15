class ProjectLineItemSerializer < ActiveModel::Serializer
  attributes :id,
            :title,
            :description,
            :completed

  has_one :project
end
