class ProjectSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :main_objective,
             :status,
             :updated_at

  belongs_to :user

  has_many :project_line_items
end
