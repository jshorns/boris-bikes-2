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
  attr_reader :bikes, :max_bikes

  def initialize max_bikes = 20
    @bikes = []
  #  @bikes.push(Bike.new())
    @max_bikes = max_bikes
  end

  def release_bike
    no_bike_error
    @bikes.pop
  end

  def dock_bike(bike)
    bikes_full_error
    @bikes.push(bike)
  end

  def has_bike
    !@bikes.empty?
  end

  private

  def no_bike_error
    raise NoBikeException if bikes.empty?
  end

  def bikes_full_error
    raise TooManyBikesException if bikes.count >= max_bikes
  end
end
