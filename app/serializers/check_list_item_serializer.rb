class CheckListItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :completed
  has_one :project_line_item
  has_one :user
end
