class CreateConditionReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :condition_reviews do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.boolean :is_admitted?
      t.timestamps
    end
  end
end
