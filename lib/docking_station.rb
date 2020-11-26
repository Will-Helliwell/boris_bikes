require_relative './bike.rb'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "No bikes available" if @bikes == []
    @bikes
  end

  def dock_bike(bike)
    # Use fail or raise to raise an error
    fail "Station Full" if @bikes.length > 19
    @bikes << bike
  end
end
