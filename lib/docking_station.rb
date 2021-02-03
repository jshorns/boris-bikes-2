class NoBikeException < StandardError
  def initialize(msg="There is no bike availlable", exception_type="custom")
    @exception_type = exception_type
    super(msg)
  end
end

class TooManyBikesException < StandardError
  def initialize(msg="There's no room at the bike inn", exception_type="custom")
    @exception_type = exception_type
    super(msg)
  end
end

class DockingStation
  attr_reader :bikes

  def initialize max_bikes = 1
    @bikes = []
    @bikes.push(Bike.new())
    @max_bikes = max_bikes
  end

  def release_bike
    if @bikes.length == 0
      raise NoBikeException.new
    else
      @bikes.pop
    end
  end

  def dock_bike(bike)
    if @bikes.length < @max_bikes
      @bikes.push(bike)
    else
      raise TooManyBikesException.new
    end
  end

  def has_bike
    !@bikes.empty?
  end
end
