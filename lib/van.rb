class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def take_broken(obj)
    obj.select {|bike| !bike.working? }
  end

  def take_fixed(obj)
    obj.select {|bike| bike.working? }
  end

  def leave_broken(obj)
    obj.select! {|bike| !bike.working? }
  end

  def leave_fixed(obj)
    obj.select! {|bike| bike.working? }
  end

  def pick_up_for_repair(docking_station)
    @bikes << take_broken(docking_station.bikes)
    @bikes.flatten!
    leave_fixed(docking_station.bikes)
  end

  def drop_off_for_repair(garage)
    garage.bikes << take_broken(@bikes)
    garage.bikes.flatten!
    leave_fixed(@bikes)
  end

  def pick_up_for_return(garage)
    @bikes << take_fixed(garage.bikes)
    @bikes.flatten!
    leave_broken(garage.bikes)
  end

end
