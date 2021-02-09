require_relative 'bike_container'

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

class NoWorkingBikes < StandardError
  def initialize(msg = 'No working Bikes! Sorry :(', exception_type = 'custom')
    @exception_type = exception_type
    super(msg)
  end
end

class DockingStation
  DEFAULT_CAPACITY = 20
  include BikeContainer
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    no_bike_error
    all_broken?
    bikes.each_with_index do |bike, i|
      return bikes.slice!(i) if bike.working?
    end
  end

  def dock_bike(bike)
    bikes_full_error
    bikes.push(bike)
  end

  def has_bike
    !@bikes.empty?
  end

  private

  def no_bike_error
    raise NoBikeException if bikes_empty?
  end

  def bikes_full_error
    raise TooManyBikesException if bikes_full?
  end

  def bikes_full?
    bikes.count >= capacity
  end

  def bikes_empty?
    bikes.empty?
  end

  def all_broken?
    raise NoWorkingBikes if bikes.none? { |bike| bike.working? }
  end
end
