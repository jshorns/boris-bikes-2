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

  it "dock bike" do
    docking_station.dock_bike(bike)
    expect(docking_station.bike).to eq bike
    expect(docking_station.bike).to be_instance_of(Bike)
  end

  it "is there a bike?" do
    docking_station.dock_bike(bike)
    expect(docking_station.bike).to be_instance_of(Bike)
    docking_station.release_bike
    expect(docking_station.bike).to eq false
  end
end
