# frozen_string_literal: true

require 'pry-byebug'
require 'json'

def add(v, w)
  [v[0] + w[0], v[1] + w[1]]
end

class Day9b
  def initialize
    @red_coords = File.read('input9').split("\n").map { |t| t.split(',').map(&:to_i) }
    @rows = @red_coords.map { |x, _| x }.max
    @cols = @red_coords.map { |_, y| y }.max
    @green_coords = @red_coords.map.with_index do |v, i|
      w = @red_coords[(i + 1) % @red_coords.length]
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
    @cache = {}
  end

  def is_inside?(v)
    return @cache[v] if @cache.key?(v)

    [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |i, j|
      k = 0
      u = v
      until @red_coords.any?(u) || @green_coords.any?(u)
        puts "i,j,k #{i},#{j},#{k}"
        if u[0].negative? || u[1].negative? || u[0] > @rows || u[1] > @cols
          @cache[v] = false
          return false
        end

        k += 1
        u = add(v, [k * i, k * j])
      end
    end
    @cache[v] = true
    true
  end

  def answer
    Enumerator.product(@red_coords, @red_coords).map do |v, w|
      a, b = v
      c, d = w
      puts "a,b #{a},#{b} c,d #{c},#{d}"
      if [[a, b], [a, d], [c, b], [c, d]].all? do |u|
        is_inside?(u)
      end
        ((a - c + 1) * (b - d + 1)).abs
      else
        0
      end
    end.max
  end
end

puts Day9b.new.answer
