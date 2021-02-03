require 'docking_station'

describe DockingStation do
subject(:docking_station) {described_class.new}

  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to :dock_bike}

  it "bike working?" do
    expect(docking_station.release_bike).to be_instance_of(Bike)
    expect(docking_station.release_bike).to be_working
  end
end
