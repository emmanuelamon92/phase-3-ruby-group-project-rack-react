class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.string :name
      t.boolean :patient_must_be_admitted
    end
  end
end
