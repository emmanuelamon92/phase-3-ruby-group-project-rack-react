class Condition < ActiveRecord::Base
    has_many :patient_conditions
    has_many :patients, through: :patient_conditions
    has_many :doctors

    def patients
        Patient.all.filter{|patient| patient.condition == self.name }
    end

    # Condition.third.patients
        # calling .third because it is an instance method and method is called on each instance.
end