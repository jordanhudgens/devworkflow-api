class CreateProjectLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_line_items do |t|
      t.references :project, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
