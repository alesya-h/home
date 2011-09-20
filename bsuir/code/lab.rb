#!/usr/bin/env ruby
# encoding: utf-8

alphabet = %w(а и м р т у ц я)
library = %w(армия мицар мария тарту рация марта марат тиара)
# тиара армия тарту

cipher = "000_101_101_001_101_010_110_010_011_001_001_000_000_100_001".to_i(2)

library.permutation(3).each do |words|
  words = words.join
  alphabet.permutation.each do |alph|
    code = words.scan(/./).map{|w| "%03b" % alph.index(w)}.join.to_i(2)
    msg = ("%015b" % [code ^ cipher]).scan(/\d\d\d\d\d/)
    puts(words) if (msg[0] == msg[1] && msg[0] == msg[2])
  end
end
