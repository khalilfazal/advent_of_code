eval_gemfile File.expand_path('Gemfile.ci', File.dirname(__FILE__))

# gems needed for testing, inspections, profiling and coverage
group :test do
  gem 'ruby-prof', '~> 0.16.2'

  # bug fix: https://github.com/glejeune/Ruby-Graphviz/pull/121
  gem 'ruby-graphviz', git: 'https://github.com/khalilfazal/Ruby-Graphviz.git'

  # +debase+ 0.2.2 has this bug: https://intellij-support.jetbrains.com/hc/en-us/community/posts/203374210-Problem-debugging-with-Rubymine
  gem 'debase', '~> 0.2.1'
end

group :build_duration do
  gem 'chronic_duration', '~> 0.10.6'
  gem 'descriptive_statistics', '~> 2.5', '>= 2.5.1'
  gem 'travis', '~> 1.8', '>= 1.8.5'
end