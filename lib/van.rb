class Van
  attr_reader :bikes_on_van

  def initialize
    @bikes_on_van = []
  end

  def pick_up_broken(docking_station)
    @bikes_on_van = docking_station.bikes.select {|bike| !bike.working? }
    docking_station.bikes.reject! {|bike| !bike.working? }
  end

  def drop_off(garage)
  end
end
