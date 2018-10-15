class AddCompletedToProjectLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_line_items, :completed, :boolean, default: false
  end
end
