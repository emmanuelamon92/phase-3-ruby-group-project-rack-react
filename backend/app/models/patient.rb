class Patient < ActiveRecord::Base
    has_many :condition_reviews
    has_many :patient_conditions
    has_many :doctors, through: :condition_reviews
    has_many :conditions, through: :patient_conditions

    def doctor
        # Doctor.all.filter{|doctor| doctor.specialty == self.condition.split(", ")[0] || self.condition.split(", ")[1]}
        Doctor.all.filter{|doctor| doctor.specialty == self.condition}
    end

    # Patient.first.doctor
        # calling .first because it is an instance method and method is called on each instance.
end