class AddStatusToProjectLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_line_items, :status, :integer, default: 0
  end
end
