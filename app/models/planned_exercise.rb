class PlannedExercise < ApplicationRecord
  belongs_to :training_template
  belongs_to :exercise
end
