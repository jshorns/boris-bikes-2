require 'docking_station'
require 'bike'
require 'garage'
require 'van'

describe Van do
subject(:van) { described_class.new }
  let(:docking_station) { double(:docking_station, :bikes => [bike, broken_bike, bike, broken_bike, bike]) }
  let(:garage) { double(:garage, :bikes => [bike, bike, bike]) }
  let(:bike) { double(:bike, :working? => true) }
  let(:broken_bike) { double(:broken_bike, :working? => false) }

  it { is_expected.to respond_to(:pick_up_for_repair).with(1).argument }
  it { is_expected.to respond_to(:drop_off_for_repair).with(1).argument }

  it 'picks up broken bikes from docking station' do
    van.pick_up_for_repair(docking_station)
    expect(van.bikes).to eq [broken_bike, broken_bike]
    expect(docking_station.bikes).to eq [bike, bike, bike]
  end

  it 'drops off broken bikes at garage' do
    van.pick_up_for_repair(docking_station)
    van.drop_off_for_repair(garage)
    expect(van.bikes).to eq []
    expect(garage.bikes).to eq [bike, bike, bike, broken_bike, broken_bike]
  end

  it 'picks up fixed bikes from garage' do
    van.pick_up_for_return(garage)
    puts garage.bikes
    expect(van.bikes).to eq [bike, bike, bike]
    expect(garage.bikes).to eq []
  end

end
