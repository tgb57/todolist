class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :list_id
      t.text :goals

      t.timestamps
    end
  end
end
