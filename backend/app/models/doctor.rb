class Doctor < ActiveRecord::Base
    has_many :condition_reviews
    has_many :patients, through: :condition_reviews
    belongs_to :condition

    def patients
        Patient.all.filter{|patient| patient.condition == self.specialty }
    end

    # Doctor.first.patients
        # calling .first because it is an instance method and method is called on each instance.
end