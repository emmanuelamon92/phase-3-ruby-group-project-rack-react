Patient.destroy_all
Doctor.destroy_all
Condition.destroy_all
ConditionReview.destroy_all

condition_hash = [{name: 'Covid', severe: true}, {name: 'Neurological', severe: true}, {name: 'Respitory', severe: false}, {name: 'Cardiovascular', severe: true}, {name: 'General', severe: false}]

doctor_hash = [{name: 'Bill', specialty: 'Covid'}, {name: 'Tanya', specialty: 'Neurological'}, {name: 'Toby', specialty: 'Respitory'}, {name: 'Alice', specialty: 'Cardiovascular'}, {name: 'Bret', specialty: 'General'}]

10.times do
    Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, condition: condition_hash.sample[:name], is_admitted: true)
end

condition_hash.each do |condition|
    Condition.create(name: condition[:name], patient_must_be_admitted: condition[:severe])
end

condition_ids = Condition.all.map{|condition| condition.id}

doctor_hash.each do |doctor|
    Doctor.create(name: doctor[:name], specialty: doctor[:specialty], condition_id: rand(condition_ids.first..condition_ids.last))
end

patient_ids = Patient.all.map{|user| user.id}
doctor_ids = Doctor.all.map{|doctor| doctor.id}

30.times do
    ConditionReview.create(patient_id: rand(patient_ids.first..patient_ids.last), doctor_id: rand(doctor_ids.first..doctor_ids.last), is_admitted: rand(2) == 1)
end