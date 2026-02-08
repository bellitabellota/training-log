class CreateExercises < ActiveRecord::Migration[8.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :exercise_type

      t.timestamps
    end
    add_index :exercises, :name, unique: true
  end
end
