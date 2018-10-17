class CreateCheckListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :check_list_items do |t|
      t.references :project_line_item, foreign_key: true
      t.text :title
      t.boolean :completed, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
