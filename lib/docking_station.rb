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
    @bike = bike
  end

  def check
    @bike
  end
end
