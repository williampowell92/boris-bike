#require_relative 'bike.rb'

class DockingStation
attr_reader :check

  def initialize
    @bikes = []
  end


  def release_bike
    if self.check == 0
      raise 'No bikes available'
    else
      @bikes.pop
    end
  end

  def dock(bike)
    if self.check >= 20
      raise 'This docking station is full'
    else
      @bikes << bike
    end
  end

  def check
    @bikes.length
  end
end
