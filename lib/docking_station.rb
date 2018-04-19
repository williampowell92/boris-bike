#require_relative 'bike.rb'

class DockingStation
attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'No bikes available' if bikes == []
    @bikes.pop
  end

  def dock(bike)
    raise 'This docking station is full' if full?
    @bikes << bike
  end

  def full?
    bikes.length >= 20
  end
end
