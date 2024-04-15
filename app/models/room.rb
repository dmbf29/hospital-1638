class Room
  class CapacityReachedError < Exception; end

  def initialize(attributes = {})
    @capacity = attributes[:capacity] # integer
    @patients = []  # array of INSTANCES
  end

  # vip.add_patient(kimberly)
  def add_patient(patient)
    if !full?
      @patients << patient
      # also give the room to the patient
      patient.room = self
    else
      raise CapacityReachedError, 'Room is full'
    end
  end

  # vip.full?
  def full?
    @patients.length >= @capacity
  end
end
