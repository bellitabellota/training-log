class CreateTrainingTemplates < ActiveRecord::Migration[8.1]
  def change
    create_table :training_templates do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :training_templates, :name, unique: true
  end
end
