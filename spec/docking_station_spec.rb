require "../lib/docking_station"

describe DockingStation do

  it "is empty when new" do
    expect(subject.bikes).to eq([])
  end

  describe "#release_bike" do
    original_bike = Bike.new
    station = DockingStation.new
    station.dock_bike(original_bike)
    new_bike = station.release_bike
    it "releases a working bike when a bike is available" do
      expect(new_bike.working?).to be true
    end
    it "releases the actual bike docked at the station (when one bike present)" do
      expect(new_bike).to eq(original_bike)
    end
    it "returns an error when called on an empty docking station" do
      expect {DockingStation.new.release_bike}.to raise_error("No bikes available")
    end
  end

  describe "#dock_bike" do
    it "docks a single bike" do
      a_bike = Bike.new
      subject.dock_bike(a_bike)
      expect(subject.bikes).to eq([a_bike])
    end
    # Write RSpec tests that expect errors
    it "returns an error when called on a docking station with >20 bikes" do
      full_docking = DockingStation.new
      20.times{full_docking.dock_bike(Bike.new)}
      expect{full_docking.dock_bike(Bike.new)}.to raise_error("Station Full")
    end
  end


end
