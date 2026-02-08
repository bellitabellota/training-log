class CreatePlannedSets < ActiveRecord::Migration[8.1]
  def change
    create_table :planned_sets do |t|
      t.references :planned_exercise, null: false, foreign_key: true
      t.integer :set_number
      t.integer :reps
      t.float :weight
      t.integer :duration_seconds

      t.timestamps
    end
  end
end
