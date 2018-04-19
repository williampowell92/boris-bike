require 'van'

describe Van do
  let(:working_bike) { double :bike, working?: true, broken?: false }
  let(:broken_bike) { double :bike, working?: false, broken?: true }
  let(:docking_station) { double :docking_station }

  it { is_expected.to respond_to(:collect_broken_bikes).with(1).argument }

  describe '#collect_broken_bikes' do
    
  end
end
