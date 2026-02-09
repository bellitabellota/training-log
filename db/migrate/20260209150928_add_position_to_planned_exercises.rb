class AddPositionToPlannedExercises < ActiveRecord::Migration[8.1]
  def change
    add_column :planned_exercises, :position, :integer
  end
end
