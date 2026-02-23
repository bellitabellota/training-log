class PlannedExercise < ApplicationRecord
  belongs_to :training_template
  belongs_to :exercise

  has_many :planned_sets, dependent: :destroy
  accepts_nested_attributes_for :planned_sets

  validates :position, presence: :true
end
