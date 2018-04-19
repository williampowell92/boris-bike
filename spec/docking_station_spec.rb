require 'docking_station'
require 'bike'

describe DockingStation do
  it "expects docked bike to be working" do
    bike = Bike.new
    subject.dock(bike)
    expect(bike).to be_working
  end

  it 'docks bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  describe "#release_bike" do
    it "raises error message when there is no bikes available" do
      expect {subject.release_bike}.to raise_error('No bikes available')
    end
  end

  describe "#dock" do
    it 'raises error message when there is full capacity' do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
      expect {subject.dock(Bike.new)}.to raise_error('This docking station is full')
    end
  end

  describe "#release_bike" do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end
end
