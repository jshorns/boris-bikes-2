require 'bike'

describe Bike do
  subject(:bike) {described_class.new}
  it { is_expected.to respond_to :working? }
end