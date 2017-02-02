fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish(array)
  longest_fish = array.first

  array.each do |fish|

    array.each do |sub_fish|
      if fish.length < sub_fish.length && longest_fish.length < sub_fish.length
        longest_fish = sub_fish
      end
    end

  end

  longest_fish
end

# p sluggish(fishes)

def dominant(array)
  return array if array.length <= 1

  midpoint = array.length / 2
  left = array.take(midpoint)
  right = array.drop(midpoint)

  dominant_merge(dominant(left), dominant(right))
end

def dominant_merge(left, right)
  sorted = []

  until left.empty? || right.empty?
    case left.first.length <=> right.first.length
    when -1
      sorted << left.shift
    when 0
      sorted << left.shift
    when 1
      sorted << right.shift
    end
  end

  sorted + left + right
end

# p dominant(fishes).last

def clever(array)
  longest_fish = array.first

  array[1..-1].each do |el|
    longest_fish = el if el.length > longest_fish.length
  end

  longest_fish
end

# p clever(fishes)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

tiles_hash = { "up"=> 0, "right-up"=> 1, "right"=> 2, "right-down"=> 3,
                "down"=> 4 , "left-down"=> 5, "left"=> 6,  "left-up"=> 7 }

def slow_dance(target, array)
  array.each_index do |i|
    return i if array[i] == target
  end
  nil
end

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

def fast_dance(target, hash)
  hash[target]
end

p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)
