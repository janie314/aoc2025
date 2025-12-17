# frozen_string_literal: true

require 'pry-byebug'
require 'json'

def add(v, w)
  [v[0] + w[0], v[1] + w[1]]
end

class Day9b
  def initialize
    @red_coords = File.read('input9').split("\n").map do |t|
      x, y = t.split(',').map(&:to_i)
      { x: x, y: y }
    end
    @rows = @red_coords.map { |v| v[:x] }.max
    @cols = @red_coords.map { |v| v[:y] }.max
    @vert_sides = @red_coords.map.with_index do |v, i|
      w = @red_coords[(i + 1) % @red_coords.length]
      if v[:x] == w[:x]
        a, b = [v[:y], w[:y]].minmax
        { x: v[:x], y_range_start: a, y_range_end: b }
      end
    end.compact
    @horiz_sides = @red_coords.map.with_index do |v, i|
      w = @red_coords[(i + 1) % @red_coords.length]
      if v[:y] == w[:y]
        a, b = [v[:x], w[:x]].minmax
        { y: v[:y], x_range_start: a, x_range_end: b }
      end
    end.compact
  end

  def inside?(v)
    @vert_sides.any? { |side| side[:x] <= v[:x] && side[:y_range_start] <= v[:y] && v[:y] <= side[:y_range_end] } &&
      @vert_sides.any? { |side| side[:x] >= v[:x] && side[:y_range_start] <= v[:y] && v[:y] <= side[:y_range_end] } &&
      @horiz_sides.any? { |side| side[:y] <= v[:y] && side[:x_range_start] <= v[:x] && v[:x] <= side[:x_range_end] } &&
      @horiz_sides.any? { |side| side[:y] >= v[:y] && side[:x_range_start] <= v[:x] && v[:x] <= side[:x_range_end] }
  end

  def answer
    i = 0
    Enumerator.product(@red_coords, @red_coords).map do |v, w|
      puts i if i % 1000 == 0
      i += 1
      if [v, w, { x: v[:x], y: w[:y] }, { x: w[:x], y: v[:y] }].all? do |u|
        inside?(u)
      end
        ((v[:x] - w[:x] + 1) * (v[:y] - w[:y] + 1)).abs
      else
        0
      end
    end.max
  end
end

puts Day9b.new.answer
