class ProjectLineItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_one :project
end
