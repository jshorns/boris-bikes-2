require 'docking_station'
require 'bike'

describe DockingStation do
subject(:docking_station) { described_class.new }
let(:bike) { Bike.new }

  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to :dock_bike}

  it "bike working?" do
    expect(docking_station.release_bike).to be_instance_of(Bike)
    expect(bike).to be_working
  end

  context "when there is one bike in the docking station" do
    before {docking_station.instance_variable_set(:@bikes, [Bike.new])}
    it "dock bike" do
      expect(docking_station.bikes[0]).to be_instance_of(Bike)
    end

    it "is there a bike?" do
      expect(docking_station.has_bike).to eq true
      docking_station.release_bike
      expect(docking_station.has_bike).to eq false
    end

    it "release_bike raises error if there is no bike" do
      docking_station.release_bike
      expect{ docking_station.release_bike }.to raise_error(NoBikeException)
    end

    it "dock_bike raises error if there are too many bikes" do
      expect{ docking_station.dock_bike(Bike.new) }.to raise_error(TooManyBikesException)
    end
    
  end

end
