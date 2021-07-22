class Condition < ActiveRecord::Base
    has_many :patient_conditions
    has_many :patients, through: :patient_conditions
    has_many :doctors

    def patient_by_condition
        Patient.all.filter{|patient| patient.condition == self.name }
    end
end