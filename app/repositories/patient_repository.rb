require 'csv'

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @patients = []
    # we start at one, then increment when used
    @next_id = 1
    @room_repository = room_repository
    load_csv if File.exist?(@csv_file_path)
  end

  def create(patient)
    # we need to assign an ID to the patient
    patient.id = @next_id
    @patients << patient
    # increment for the next time
    @next_id += 1
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # turn the row into a Patient
      # we need to convert any non-string attributes in the row first
      # we need to turn the foreign_key into an instance
      p row
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == "true"
      row[:room] = @room_repository.find(row[:room_id].to_i) # NEEDS to be an instance
      patient = Patient.new(row)
      @patients << patient
      @next_id = patient.id + 1
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'name', 'cured', 'room_id']
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured?, patient.room.id]
      end
    end
  end
end
