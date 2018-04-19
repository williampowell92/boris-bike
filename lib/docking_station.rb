class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bikes available' if empty? || all_broken?
    @bikes.delete_at(working_bike_position)
  end

  def dock(bike)
    raise 'This docking station is full' if full?
    @bikes << bike
  end

  def release_broken_bikes
    raise 'No broken bikes available' if empty? || all_working?
    broken_bikes = collate_broken_bikes
    remove_broken_bikes_from_dock
    broken_bikes
  end

  private

  def full?
    bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    bikes == []
  end

  def all_broken?
    bikes.all? {|bike| bike.broken? }
  end

  def all_working?
    bikes.all? {|bike| bike.working? }
  end

  def working_bike_position
    @bikes.each_with_index do |bike, position|
      return position if bike.working?
    end
  end

  def remove_broken_bikes_from_dock
    @bikes.reject! { |bike| bike.broken? }
  end

  def collate_broken_bikes
    @bikes.select { |bike| bike.broken? }
  end
end
