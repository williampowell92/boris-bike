#require_relative 'bike.rb'

class DockingStation
attr_reader :check

  def release_bike
    bike = Bike.new
  end

  def dock(bike)
    @bike = bike
  end

  def check
    @bike
  end
end
