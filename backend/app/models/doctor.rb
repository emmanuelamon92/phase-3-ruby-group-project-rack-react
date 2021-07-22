class Doctor < ActiveRecord::Base
    has_many :condition_reviews
    has_many :patients, through: :condition_reviews
    belongs_to :condition

    def patients_by_condition
        Patient.all.filter{|patient| patient.condition == self.specialty }
    end
end