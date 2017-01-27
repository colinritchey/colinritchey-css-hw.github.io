class Queue
  attr_accessor :set

  def initialize
    @set = []
  end

  def enqueue(el)
    @set.push(el)
  end

  def dequeue
    @set.shift
  end

  def show
    copy = Queue.new

    self.set.each do |item|
      copy.enqueue(item)
    end

    copy
  end

end
