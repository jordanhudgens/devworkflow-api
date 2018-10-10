class ProjectSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :main_objective,
             :updated_at

  belongs_to :user
end
