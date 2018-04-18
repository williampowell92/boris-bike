require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike)}
  it {is_expected.to respond_to(:dock)}
  it {is_expected.to respond_to(:use)}
  it {is_expected.to respond_to(:check)}

  it "releases new bike" do
    bike = subject.release_bike
    expect(bike).to be_working
  end



end
