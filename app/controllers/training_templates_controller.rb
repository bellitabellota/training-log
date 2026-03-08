class TrainingTemplatesController < ApplicationController
  before_action :get_exercise_options, only: [ :new, :create ]

  def new
    @training_template = TrainingTemplate.new
    1.times do | number |
      planned_exercise = @training_template.planned_exercises.build(position: number + 1)

      3.times do |set_number |
        planned_exercise.planned_sets.build(set_number: set_number + 1)
      end
    end
  end

  def create
    @current_user = Current.user
    @training_template = @current_user.training_templates.build(training_template_params)

    if @training_template.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def get_exercise_options
    @exercise_options = Exercise.all.map { |exercise| [ exercise.name, exercise.id, { data: { exercise_type: exercise.exercise_type } } ] }
  end

  def training_template_params
    params.expect(training_template: [ :name, planned_exercises_attributes: [ [ :position, :exercise_id, planned_sets_attributes: [ [ :set_number, :reps, :weight, :duration_seconds ] ] ] ] ])
  end
end
