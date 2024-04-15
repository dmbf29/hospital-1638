require_relative 'app/repositories/patient_repository'
require_relative 'app/models/patient'
require_relative 'app/models/room'

csv_file_path = 'data/patients.csv'
p patient_repository = PatientRepository.new(csv_file_path, room_repository)

kimberly = Patient.new(name: 'kimberly')
moritz = Patient.new(name: 'moritz')
rei = Patient.new(name: 'rei')

# patient_repository.create(kimberly)
# patient_repository.create(moritz)
# patient_repository.create(rei)

# p patient_repositorys



vip = Room.new(capacity: 2)
public = Room.new(capacity: 20)

# vip.add_patient(kimberly)
# vip.add_patient(moritz)
# public.add_patient(rei)

# p kimberly

# p vip
# p public
# "#{kimberly.name} is #{kimberly.cured? ? 'cured' : 'not cured'}."
