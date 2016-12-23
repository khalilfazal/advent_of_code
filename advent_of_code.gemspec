# coding: utf-8
lib = File.expand_path '../lib', __FILE__
$LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib
require 'advent_of_code/version'

# TODO: finish reading style guide
# TODO: finish fixing dependencies
# TODO: create module diagram
# TODO: annotate all modules, classes, and methods with parameter and return types
# TODO: get to 100% code coverage

Gem::Specification.new do |spec|
  spec.name = 'advent_of_code'
  spec.version = AdventOfCode::VERSION
  spec.authors = ['Khalil Fazal']
  spec.email = ['khalil.fazal@uoit.net']
  spec.licenses = ['GPL-2.0']

  spec.summary = 'Solves puzzles at http://adventofcode.com/'
  spec.description = 'Solutions to Advent of Code puzzles'
  spec.homepage = 'https://github.com/khalilfazal/advent_of_code'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = %w(app lib spec)

  # standalone_migrations (5.0.0) depends on activesupport (= 5.0.0.1)
  spec.add_runtime_dependency 'activerecord', '~> 5.0', '>= 5.0.0.1'
  spec.add_runtime_dependency 'require_all', '~> 1.3'
  spec.add_runtime_dependency 'standalone_migrations', '~> 5.0'

  # standalone_migrations (5.0.0) depends on rake (~> 10.0)
  spec.add_runtime_dependency 'rake', '~> 10.0'
  spec.add_runtime_dependency 'rspec', '~> 3.5'
  spec.add_runtime_dependency 'sqlite3', '~> 1.3'

  spec.add_development_dependency 'rspec-prof', '~> 0.0.7'
  spec.add_development_dependency 'ruby-prof', '~> 0.16.2'
  spec.add_development_dependency 'simplecov', '~> 0.12'
end