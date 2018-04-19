require_relative '../lib/docking_station.rb'

def variable_capacity
  capacity = 30
  station = DockingStation.new(capacity)
  station.capacity == capacity
end

def default_capacity
  station = DockingStation.new
  station.capacity == DockingStation::DEFAULT_CAPACITY
end
