#!/usr/bin/env ruby
begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}\n", output) }
rescue LoadError => err
  puts "no awesome_print :("
end
Signal.trap('SIGQUIT') do
  if defined? Rails
    if ActiveRecord::Base.logger
      puts 'disabled AR logger'
      $old_ar_logger = ActiveRecord::Base.logger
      ActiveRecord::Base.logger = nil
    else
      puts 'enabled AR logger'
      ActiveRecord::Base.logger = $old_ar_logger
    end
  end
end
Signal.trap('SIGWINCH') do
  Readline.set_screen_size(*(`stty size`.split(' ').map(&:to_i)))
end
class Object
  def mm
    self.methods - Module.methods
  end
  def cm
    self.methods - Class.methods
  end
  def cm1
    self.methods - self.superclass.methods
  end
  def cm2
    self.methods - self.superclass.superclass.methods
  end
  def m
    self.methods - Object.new.methods
  end
  def m1
    self.methods - self.class.superclass.instance_methods
  end
  def m2
    self.methods - self.class.superclass.superclass.instance_methods
  end
end
Pry.commands.alias_command 'l', 'ls'
# Pry.commands.alias_command 'c', 'continue'
# Pry.commands.alias_command 's', 'step'
# Pry.commands.alias_command 'n', 'next'
# Pry.commands.alias_command 'f', 'finish'
