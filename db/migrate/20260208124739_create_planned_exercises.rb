class CreatePlannedExercises < ActiveRecord::Migration[8.1]
  def change
    create_table :planned_exercises do |t|
      t.references :training_template, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
