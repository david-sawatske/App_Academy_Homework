# Big O-ctopus and Biggest Fish
#
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.
#
# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths
# to all other fish lengths.

# 0(n ** 2) ex is Quadratic ie nested x2 iterations or bubble_sort

def quad_biggest_fish(fish_arr)
  fishes.each_with_index do |fish1, i1|
    max_length = 0

    fishes.each_with_index do |fish2, i2|
      next if i1 == i2
      max_length = fish2.length if fish2.length > fish1.length
    end

    return fish1 if max_length
  end
end


# Dominant Octopus
#
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm
# that runs in O(n log n) in the Sorting Demo. Remember that Big O is classified
# by the dominant term.

# merge sort is the example

class Array
  def merge_sort_fish(&prc)
    return self if length <= 1
    prc ||= Proc.new { |x, y| x <=> y }

    mid = length / 2
    left = self.take(mid)
    right = self.drop(mid)

    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
        merged << right.shift
      when 1
        merged << right.shift
      end
    end

    merged + left + right
  end
end


# Clever Octopus
#
# Find the longest fish in O(n) time.
# O(n) = Linear search

def linear_biggest_fish(fishes)
  biggest_fish = nil

  fishes.each do |fish|
    if fish.length > biggest_fish.length
      biggest_fish = fish
    end
  end

  biggest_fish
end


# Slow Dance
#
# Given a tile direction, iterate through a tiles array to return the tentacle
# number (tile index) the octopus must move. This should take O(n) time.

tiles_array = ["up", "right-up", "right", "right-down", "down",
               "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end


# Constant Dance!
#
# Now that the octopus is warmed up, let's help her dance faster. Use a different
# data structure and write a new function so that you can access the tentacle
# number in O(1) time.

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
