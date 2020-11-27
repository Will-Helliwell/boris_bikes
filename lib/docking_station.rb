require_relative './bike.rb'


class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes available" if self.empty?
    @bikes.shift
  end

  def dock_bike(bike)
    # Use fail or raise to raise an error
    fail "Station Full" if self.full?
    @bikes << bike
  end

  private
  def full?
    @bikes.length >= @capacity ? true : false
  end

  def empty?
    @bikes.length == 0 ? true : false
  end

end
