require 'docking_station'
require 'bike'

describe DockingStation do
  describe '#initialize', :initialize do
    it 'Accepts a capacity greater than default capacity' do
      capacity = 30
      station = DockingStation.new(capacity)
      expect(station.capacity).to eq capacity
    end

    it 'Sets default capacity to 20 when no argument is given' do
      station = DockingStation.new
      expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe "#release_bike", :release_bike do
    it "raises error message when there is no bikes available" do
      expect {subject.release_bike}.to raise_error('No bikes available')
    end

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'wont release broken bikes' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end

    it 'releases a working bike among broken bikes' do
      bikes = Array.new(3) { Bike.new }
      bikes[2].report_broken
      bikes[0].report_broken
      bikes.each { |bike| subject.dock(bike)}
      released_bike = subject.release_bike
      expect(released_bike).to be_working

    end
  end

  describe "#dock", :dock do
    it "expects docked bike to be working" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes.first).to be_working
    end

    it 'docks bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'raises error message when there is full capacity' do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
      expect {subject.dock(Bike.new)}.to raise_error('This docking station is full')
    end

    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end
  end
end
