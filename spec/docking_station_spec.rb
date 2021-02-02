require 'docking_station'
require 'bike.rb'

  
describe DockingStation do

    
subject(:docking_station) {described_class.new}
  
  it { is_expected.to respond_to :release_bike}


it 'releases the bike' do
expect(docking_station.release_bike.working?).to eq true


end


end 