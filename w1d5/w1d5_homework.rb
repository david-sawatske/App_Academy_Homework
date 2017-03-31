# EX 1
class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

# EX 2
class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

# EX 3
class Map
  def initialize
    @map = []
  end

  def set(key, value)
    # Do maps have ordered indices?
    @map.delete_if { |pair| pair[0] == key }
    @map[key] = value
  end

  def get(key)
    @map.select { |pair| pair[0] == key }
    nil
  end

  def delete(key)
    @map.delete_if { |pair| pair[0] == key }
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
