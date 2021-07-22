class CreatePatientConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_conditions do |t|
      t.integer :patient_id
      t.integer :condition_id
      t.timestamps
    end
  end
end
