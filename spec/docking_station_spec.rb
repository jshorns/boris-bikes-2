require 'docking_station'


describe DockingStation do
subject(:docking_station) {described_class.new}

  it { is_expected.to respond_to :release_bike}

  it "bike working?" do
    bike = docking_station.release_bike
    expect(bike.working?).to eq(true)
  end
end
