class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description, null: true
      t.string :status
      t.string :creator
      t.string :performer, null: true
      t.boolean :completed

      t.timestamps
    end
  end
end
