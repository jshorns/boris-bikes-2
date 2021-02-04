require 'docking_station'
require 'bike'

describe DockingStation do
subject(:docking_station) { described_class.new }
let(:bike) { Bike.new }
let(:broken_bike) { Bike.new.broken }

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

    it "has bike?" do
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
        docking_station.capacity.times { docking_station.dock_bike(bike) }
        expect { docking_station.send(:bikes_full_error) }.to raise_error(TooManyBikesException)
      end
    end
  end

  describe '#bikes_full?' do
    it 'returns true if bikes is full' do
      docking_station.capacity.times { docking_station.dock_bike(bike) }
      expect(docking_station.send(:bikes_full?)).to be true
    end
  end

  describe '#bikes_empty?' do
    it 'returns true if bikes is empty' do
      expect(docking_station.send(:bikes_empty?)).to be true
    end
  end

  describe 'user can set docking station capacity' do
    it 'sets capacity to 40 when 40 passed as initialize argument' do
      expect(described_class.new(40).capacity).to eq 40
    end
  end

  describe 'default capacity of docking station is 20' do
    it 'new instance of docking station with no args has 20 capacity' do
      expect(described_class.new.capacity).to eq 20
    end
  end

  describe '#all_broken?' do
    context 'when bike is broken' do
      it 'does not release bike' do
        docking_station.dock_bike(broken_bike)
        expect { docking_station.send(:all_broken?) }.to raise_error NoWorkingBikes
      end
    end
  end

  describe '#release_bike' do
    it 'does not release bike if all broken' do
      docking_station.dock_bike(broken_bike)
      expect { docking_station.release_bike }.to raise_error NoWorkingBikes
    end
  end

  describe '#release_bike' do
    it 'does not release bike if all broken' do
      [broken_bike, bike, broken_bike].each { |bike| docking_station.dock_bike(bike) }
      expect(docking_station.release_bike).to be_working
    end
  end

  describe '#dock_bike' do
    it 'accepts broken bike' do
      docking_station.dock_bike(broken_bike)
      expect(docking_station.bikes).to include(broken_bike)
    end
  end
end
