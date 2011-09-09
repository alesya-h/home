require 'rubygems'
require 'wirble'
Wirble.init
Wirble.colorize
class Object
  def regexp_find_methods(rx)
    self.methods.select{|s| s =~ rx }
  end
end
