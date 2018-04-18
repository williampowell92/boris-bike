require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike)}
  it {is_expected.to respond_to(:dock).with(1).argument}


  it "releases new bike" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docks bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.check).to eq bike 
  end

end
