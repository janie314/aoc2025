# frozen_string_literal: true

require 'pry-byebug'

input = File.read('input9').split("\n").map { |t| t.split(',').map(&:to_i) }

res = Enumerator.product(input, input).map do |v, w|
  a, b  = v
  c, d  = w
  ((a - c + 1) * (b - d + 1)).abs
end.max

puts res
