class DockingStation
  attr_reader :has_bike

  def initialize
    @has_bike = nil
  end

  def release_bike
    @has_bike = false
    Bike.new()
  end

  def dock_bike(bike)
    @has_bike = bike
  end
end
