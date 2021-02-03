require 'docking_station'

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
    expect(docking_station.has_bike).to eq true
  end
end
