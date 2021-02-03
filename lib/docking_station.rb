class NoBikeException < StandardError
  def initialize(msg="There is no bike availlable", exception_type="custom")
    @exception_type = exception_type
    super(msg)
  end
end

class DockingStation
  attr_reader :bike

  def initialize
    @bike = Bike.new()
  end

  def release_bike
    if @bike == false
      raise NoBikeException.new
    else
      bike = @bike
      @bike = false
      return bike
    end
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
