# frozen_string_literal: true

require 'pry-byebug'
require 'json'

red_coords = File.read('testinput9').split("\n").map { |t| t.split(',').map(&:to_i) }

green_coords = red_coords.map.with_index do |v, i|
  w = red_coords[(i + 1) % red_coords.length]
  if v[0] == w[0]
    (([v[1], w[1]].min + 1)..([v[1], w[1]].max - 1)).map do |i|
      [v[0], i]
    end
  elsif v[1] == w[1]
    (([v[0], w[0]].min + 1)..([v[0], w[0]].max - 1)).map do |i|
      [i, v[1]]
    end
  end
end.flatten(1)

puts "red #{red_coords.to_json}"
puts "green #{green_coords.to_json}"

res = Enumerator.product(red_coords, red_coords).map do |v, w|
  a,  b  = v
  c,  d  = w
  if Enumerator.product([a, c].min..[a, c].max, [b, d].min..[b, d].max).all? do |u|
    red_coords.any?(u) || green_coords.any?(u)
  end
    puts "noreject #{v.to_json} #{w.to_json}"
    ((a - c + 1) * (b - d + 1)).abs
  else
    puts "reject #{v.to_json}#{w.to_json}"
    0
  end
end

binding.pry

puts res
