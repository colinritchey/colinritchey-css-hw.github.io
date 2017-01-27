class Map
  attr_accessor :set

  def initialize
    @set = []
  end

  def assign(key, value)
    @set << [key, value]
  end

  def lookup(key)
    val = nil

    @set.each do |item|
      val = item if item.first == key
    end

    val
  end

  def remove(key)
    @set.each do |item|
      @set.delete(item) if item.first == key
    end
  end
end

map_set = Map.new
map_set.assign(1, "hello")
map_set.assign(2, "world")

p map_set.set
map_set.remove(3)
p map_set.set
