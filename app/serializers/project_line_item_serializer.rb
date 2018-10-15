class ProjectLineItemSerializer < ActiveModel::Serializer
  attributes :id,
            :title,
            :description,
            :status

  has_one :project
end
