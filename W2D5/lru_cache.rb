class LRUCache
  attr_accessor :cache, :size

  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    @cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    handles_space(el)
    @cache.push(el)
  end

  def show
    # shows the items in the cache, with the LRU item first
    @cache.each_with_index do |el, index|
      p "#{index}: #{el}"
    end
  end

  private
  # helper methods go here!
  def handles_space(el)
    if @cache.include?(el)
      @cache.delete(el)

    elsif @cache.size == 4
      @cache.shift
    end

  end
end
