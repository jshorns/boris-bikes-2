require 'bike'

describe Bike do
  subject(:bike) { described_class.new }
  it { is_expected.to respond_to :working? }

  describe '#broken' do
    it 'sets working to false' do
      bike.broken
      expect(bike).to_not be_working
    end
  end
end
