class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.integer :reporter_id
      t.integer :assignee_id
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
