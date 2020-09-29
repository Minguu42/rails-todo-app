class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.date :time_limit
      t.boolean :done, null: false, default: false
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
