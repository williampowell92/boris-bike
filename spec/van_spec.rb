require 'van'

describe Van do
  let(:working_bike) { double :bike, working?: true, broken?: false }
  let(:broken_bike) { double :bike, working?: false, broken?: true }
  let(:broken_bike_station) { double :docking_station, release_broken_bikes: [broken_bike] }

  it { is_expected.to respond_to(:collect_broken_bikes).with(1).argument }

  describe '#collect_broken_bikes', :collect_broken_bikes do
    it 'collects broken bikes from station' do
      subject.collect_broken_bikes(broken_bike_station)
      expect(subject.bikes).to eq [broken_bike]
    end
  end
end
