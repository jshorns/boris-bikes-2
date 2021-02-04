require 'docking_station'
require 'bike'

describe DockingStation do
subject(:docking_station) { described_class.new }
let(:bike) { Bike.new }

  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to(:dock_bike).with(1).argument}

  context "when there is one bike in the docking station" do
    before {docking_station.instance_variable_set(:@bikes, [Bike.new])}

    it "bike working?" do
      expect(docking_station.release_bike).to be_instance_of(Bike)
      expect(bike).to be_working
    end

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
  end

  describe '#no_bike_error' do
    context 'when bikes is empty' do
      it 'raises error' do
        expect { subject.send(:no_bike_error) }.to raise_error(NoBikeException)
      end
    end
  end

  describe '#bikes_full_error' do
    context 'when bikes is full' do
      it 'raises error' do
        docking_station.max_bikes.times { docking_station.dock_bike(bike) }
        expect { docking_station.send(:bikes_full_error) }.to raise_error(TooManyBikesException)
      end
    end
  end

  describe '#bikes_full?' do
    it 'returns true if bikes is full' do
      docking_station.max_bikes.times { docking_station.dock_bike(bike) }
      expect(docking_station.send(:bikes_full?)).to be true
    end
  end

  describe '#bikes_empty?' do
    it 'returns true if bikes is empty' do
      expect(docking_station.send(:bikes_empty?)).to be true
    end
  end
end
