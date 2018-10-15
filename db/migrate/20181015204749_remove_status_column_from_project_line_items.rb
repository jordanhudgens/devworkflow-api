class RemoveStatusColumnFromProjectLineItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :project_line_items, :status, :boolean
  end
end
