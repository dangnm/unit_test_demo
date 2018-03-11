require 'pathname'

Dir.glob('spec/**/shared_examples/*.rb').each do |example|
  require Pathname.new(ENV['PROJECT_ROOT']).join(example)
end
