require_relative 'bike_container'

class Van
  DEFAULT_CAPACITY = 10
  include BikeContainer

  def pick_up_for_repair(docking_station)
    take_broken(self, docking_station)
  end

  def drop_off_for_repair(garage)
    take_broken(garage, self)
  end

  def pick_up_for_return(garage)
    take_fixed(self, garage)
  end

  def drop_off_when_fixed(docking_station)
    take_fixed(docking_station, self)
  end

end
