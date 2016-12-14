#!/usr/bin/env ruby

require 'json'
require 'data_transformer'

Dir.chdir("#{ENV['HOME']}/p/fork/corpora/data")

def dig(data, *path)
  if path.empty?
    data
  else
    current = path.first
    rest = path[1..-1]
    if current.is_a? Array
      data.map{|x| dig(x, current.first, *rest)}
    else
      dig(data[current],*rest)
    end
  end
end

def data(name, *args)
  dig(JSON.parse(File.read(name+'.json')),*args)
end

# data("words/adjs","adjs").sample
# data('animals/common',"animals").sample
# data("words/verbs","verbs").map{|x| x["present"]}.sample
# data("words/nouns", "nouns").sample

def main_pass(joiner: ":")
  [
    ["words/adjs","adjs"],
    ["animals/common","animals"],
    ["words/verbs","verbs", ["present"]],
    ["words/nouns","nouns"]
  ].map do |x|
    data(*x).sample
  end.join(joiner)
end

def sygil; %W(! $ % @ - +).sample; end

def pass(**opts)
  sygil + main_pass(**opts).capitalize + sygil
end

puts pass
