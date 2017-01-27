class Stack
  attr_accessor :set

  def initialize
    # create ivar to store stack here!
    @set = []
  end

  def add(el)
    # adds an element to the stack
    @set.push(el)
  end

  def remove
    # removes one element from the stack
    @set.pop
  end

  def show
    # return a copy of the stack
    copy = Stack.new

    self.set.each do |item|
      copy.add(item)
    end

    copy
  end
end
