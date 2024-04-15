class Patient
  attr_reader :name
  attr_accessor :room, :id

  def initialize(attributes = {})
    # @name = name # No longer like this
    @id = attributes[:id]
    @name = attributes[:name] # string
    @cured = attributes[:cured] || false # boolean
    @room = attributes[:room] # INSTANCE
  end

  def cured?
    @cured
  end
end
