<!-- prettier-ignore-start -->

# Medical Records App

## Patient Stories
    - sign in patient
    - doctor comes for treatment
    - condition diagnosed
    - either gets admitted or goes home

## patient model
    - has_many :condition_reviews
    - has_many :patient_conditions
    - has_many :doctors, through: :condition_reviews
    - has_many :conditions, through: :patient_conditions

## condition_review model
    - belongs_to :patient
    - belongs_to :doctor

## doctor model
    - has_many :condition_reviews
    - has_many :patients, through: :condition_reviews
    - belongs_to :condition

## condition model
    - has_many :patient_conditions
    - has_many :patients, through: :patient_conditions
    - has_many :doctors

## patient_condition model
    - belongs_to :patient
    - belongs_to :condition

:patient ---< :condition_review >--- :doctor
    |                                  |
    |                                  |
    A                                  |
:patient_condition                     |
    V                                  |
    |                                  |
    |                                  |
:condition >---------------------------

<!-- Sprouts.create(name: "Brocoli", ___:"___") -->

## patient attributes:
    :name
    :condition
    :timestamps

## condition attributes:
    :name
    :patient_must_be_admitted?

## doctor attributes:
    :name
    :condition_doctor_treats

## patient_condition attributes:
    :patient_id
    :condition_id
    :timestamps

## condition_review attributes:
    :patient_id
    :doctor_id
    :is_admitted?
    :timestamps

<!-- prettier-ignore-end -->
