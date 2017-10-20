require_relative './generators/create_app'
require_relative './generators/create_model'

command = ARGV.shift
args = ARGV

case command
when 'create_app'
  Resi::Generators::CreateApp.start
when 'create_model'
  Resi::Generators::CreateModel.start
else
  puts 'unknown command'
end
