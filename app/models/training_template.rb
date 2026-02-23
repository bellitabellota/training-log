class TrainingTemplate < ApplicationRecord
  belongs_to :user
  # has_many :training_sessions, dependent: :destroy

  has_many :planned_exercises, dependent: :destroy
  accepts_nested_attributes_for :planned_exercises

  validates :name, presence: true, uniqueness: true
end
