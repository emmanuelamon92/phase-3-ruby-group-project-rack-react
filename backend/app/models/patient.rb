class Patient < ActiveRecord::Base
    has_many :condition_reviews
    has_many :patient_conditions
    has_many :doctors, through: :condition_reviews
    has_many :conditions, through: :patient_conditions

    def doctors_by_specialty
        Doctor.all.filter{|doctor| doctor.specialty == self.condition }
    end
end