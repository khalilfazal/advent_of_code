# coding: utf-8
lib = File.expand_path '../lib', __FILE__
$LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib
require 'advent_of_code/version'

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
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = %w(app lib spec)
end