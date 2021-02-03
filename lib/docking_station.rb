class DockingStation
  attr_reader :bike

  def initialize
    @bike = Bike.new()
  end

  def release_bike
    bike = @bike
    @bike = false
    return bike
  end

  def dock_bike(bike)
    @bike = bike
  end

  def has_bike
    if bike == false
      return false
    else
      return true
    end
  end
end
