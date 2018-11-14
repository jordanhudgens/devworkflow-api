class CheckListItem < ApplicationRecord
  belongs_to :project_line_item
  belongs_to :user, optional: true

  default_scope order('id ASC')
end
