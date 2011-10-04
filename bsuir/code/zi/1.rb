#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

class Fixnum
  def bit_range(first,last)
    rez = 0
    (first..last).to_a.reverse.each do |i|
      rez <<= 1
      rez += self[i]
    end
    rez
  end
  def map_bits_by_of_with(by,total,with)
    rez=0
    (0...(total/by)).each do |i|
      rez <<= 3
      rez += with.index(bit_range(i*by,(i+1)*by-1))
    end
  end
end

alphabet = %w(а и м р т у ц я)
alphabet_num = [0,1,2,3,4,5,6,7]
library = %w(армия мицар мария тарту рация марта марат тиара)
library_num = library.map{|i| [].tap{|mas| i.each_char{|c| mas << alphabet.index(c)}}}
input = "000_101_101_001_101___010_110_010_011_001___001_000_000_100_001".to_i(2)

lp = library_num.permutation(3).map do |i|
  p i
  rez=0
  3.times do |n|
    rez <<= 3
    rez += i[n]
  end
end

lp.to_a
n=0
alphabet.permutation.each do |a|
  puts n+=1
  lp.each do |i|
    clear_coded_words = i.map_bits_by_of_with(3,15,a)
    x = clear_coded_words ^ input
    p i if x.bit_range(0,15) == x.bit_range(16,31) and x.bit_range(0,15) == x.bit_range(32,48)
  end
end
