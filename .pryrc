# -*- mode: ruby -*-
begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}\n", output) }
rescue LoadError => err
  puts "no awesome_print :("
end
Signal.trap('SIGWINCH') do
  Readline.set_screen_size(*(`stty size`.split(' ').map(&:to_i)))
end
Pry.commands.alias_command 'l', 'ls'
# Pry.commands.alias_command 'c', 'continue'
# Pry.commands.alias_command 's', 'step'
# Pry.commands.alias_command 'n', 'next'
# Pry.commands.alias_command 'f', 'finish'
