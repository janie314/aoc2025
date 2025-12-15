# frozen_string_literal: true

require 'pry-byebug'

def dist(v, w)
  v.zip(w).map { |a, b| (a - b)**2 }.sum
end

coords = File.read('input8').split("\n").map do |line|
  line.split(',').map(&:to_i)
end

pairs = Enumerator.product(coords, coords).filter do |v, w|
  (v != w) && (v[0] <= w[0])
end.to_a.sort do |pair1, pair2|
  a, b = pair1
  c, d = pair2
  dist(a, b) <=> dist(c, d)
end

circuits = []
count = 0
pairs.each do |v, w|
  i = circuits.find_index { |circuit| circuit.any? v }
  j = circuits.find_index { |circuit| circuit.any? w }

  count += if i.nil?
             if j.nil?
               circuits.append([v, w])
             else
               circuits[j].append(v)
             end
             1
           elsif j.nil?
             circuits[i].append(w)
             1
           elsif i == j
             0
           else
             circuits.append(circuits[i].concat(circuits[j]))
             circuits = circuits.reject.with_index { |_, k| k == i || k == j }
             1
           end
  break if count == 999
end

puts(circuits.map { |arr| arr.uniq.length }.sort.reverse.take(3).reduce { |a, b| a * b })
