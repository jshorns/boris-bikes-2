class Bike
  attr_accessor :working
  alias :working? :working
  undef :working

  def initialize(working = true)
    @working = working
    #return "working hard or hardly working on better jokes?"
  end

  def broken
    self.working = false
    self
  end
end
