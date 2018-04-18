#require_relative 'bike.rb'

class DockingStation
attr_reader :check

  def release_bike
    if self.check == nil
      raise 'No bikes available'
    else
      @bike
    end
  end

  def dock(bike)
    if self.check != nil
      raise 'This docking station is full'
    else
      @bike = bike
    end
  end

  def check
    @bike
  end
end
