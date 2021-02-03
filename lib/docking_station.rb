class DockingStation
  attr_reader :has_bike

  def initialize
    @has_bike = true
  end

  def release_bike
    @has_bike = false
    Bike.new()
  end

  def dock_bike(bike)
    @has_bike = true
  end
end
