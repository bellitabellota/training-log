class TrainingTemplate < ApplicationRecord
  belongs_to :user
  has_many :training_sessions, dependent: :destroy
  has_many :planned_sessions, dependent: :destroy
end
