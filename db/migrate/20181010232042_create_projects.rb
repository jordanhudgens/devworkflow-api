class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :main_objective
      t.references :user, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end