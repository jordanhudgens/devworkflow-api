class ProjectLineItemSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :description,
             :completed,
             :project_id,
             :image_urls

  has_one :project
  has_many :check_list_items
end
