class Map
  attr_accessor :set

  def initialize
    @set = []
  end

  def assign(key, value)
    remove(key) if lookup(key)
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

  def show
    copy = Map.new

    self.set.each do |item|
      copy.assign(item.first, item.last)
    end

    copy
  end
end
