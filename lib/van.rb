class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_broken_bikes(docking_station)
    @bikes.concat(docking_station.release_broken_bikes)
  end
end
