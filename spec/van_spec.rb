require 'docking_station'
require 'bike'
require 'garage'
require 'van'

describe Van do
subject(:van) { described_class.new }
  let(:docking_station) { double(:docking_station, :bikes => [bike, broken_bike, bike, broken_bike, bike]) }
  let(:garage) { double :garage }
  let(:bike) { double(:bike, :working? => true) }
  let(:broken_bike) { double(:broken_bike, :working? => false) }

  it { is_expected.to respond_to(:pick_up_broken).with(1).argument }
  it { is_expected.to respond_to(:drop_off).with(1).argument }

  it 'picks up broken bikes from docking station' do
    van.pick_up_broken(docking_station)
    expect(van.bikes_on_van).to eq [broken_bike, broken_bike]
    expect(docking_station.bikes).to eq [bike, bike, bike]
  end

end
