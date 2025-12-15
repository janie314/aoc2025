# frozen_string_literal: true

require 'pry-byebug'
require 'json'

def main
  red_coords = File.read('input9').split("\n").map { |t| t.split(',').map(&:to_i) }

  cols = red_coords.map { |_, y| y }.max
  grid = (0..red_coords.map { |x, _| x }.max).map { |_| Array.new(cols + 1) }
  print_grid(grid)

  red_coords.each_with_index do |v, i|
    a, b = v
    grid[a][b] = 'R'
    w = red_coords[(i + 1) % red_coords.length]
    if v[0] == w[0]
      (([v[1], w[1]].min + 1)..([v[1], w[1]].max - 1)).map do |i|
        grid[v[0]][i] = 'G'
      end
    elsif v[1] == w[1]
      (([v[0], w[0]].min + 1)..([v[0], w[0]].max - 1)).map do |i|
        grid[i][v[1]] = 'G'
      end
    end
  end

  print_grid(grid)
end

def print_grid(grid)
  grid.each do |row|
    row.each do |entry|
      print entry || '.'
    end
    puts
  end
  puts
end

main
