# frozen_string_literal: true

require 'pry-byebug'

red_coords = File.read('testinput9').split("\n").map { |t| t.split(',').map(&:to_i) }

green_coords = red_coords.map.with_index do |v, i|
  w = red_coords[(i + 1) % red_coords.length]
  if v[0] == w[0]
    ([v[1], w[1]].min + 1..[v[1], w[1]].max - 1).map do |i|
      [v[0], i]
    end
  else
    ([v[0], w[0]].min + 1..[v[0], w[0]].max - 1).map do |i|
      [i, v[1]]
    end
  end
end.flatten(1)

res = Enumerator.product(red_coords, red_coords).map do |v, w|
  a, b  = v
  c, d  = w
  if Enumerator.product([a, c].min..[a, c].max, [b, d].min..[b, d].max).all? do |x, y|
    red_coords.any?([x, y]) || green_coords.any?([x, y])
  end
    ((a - c + 1) * (b - d + 1)).abs
  else
    0
  end
end.max

binding.pry

puts res
