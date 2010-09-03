require 'lib/game_of_life'

TITLE = 'Game of Life'
MAIN_RDOC = 'README.rdoc'

TEST_FILES       = Dir['test/**/test_*.rb']
EXTRA_RDOC_FILES = ['README.rdoc', 'HISTORY.txt']

Gem::Specification.new do |spec|
  spec.author                = 'Bob Nadler, Jr.'
  spec.description           = 'A Ruby based version of the Game of Life.'
  spec.email                 = 'thethirdswitch [at] gmail'
  spec.extra_rdoc_files      = EXTRA_RDOC_FILES
  spec.files                 = `git ls-files`.split("\n") - ['.gitignore']
  spec.has_rdoc              = true
  spec.homepage              = 'http://bobnadler.com'
  spec.name                  = 'game_of_life'
  spec.required_ruby_version = '>=1.9.2'
  spec.test_files            = TEST_FILES
  spec.version               = GameOfLife::VERSION
  spec.rubyforge_project     = 'game_of_life' # required for validation

  spec.summary = <<-SUMMARY
This is a Ruby implementation of the Game of Life [1].

[1] http://en.wikipedia.org/wiki/Conway's_Game_of_Life
SUMMARY

  spec.rdoc_options << '--title' << TITLE <<
                       '--main' << MAIN_RDOC

  spec.add_development_dependency('rake', '>=0.8.7')
  spec.add_development_dependency('relevance-rov', '>=0.9.2.1')
end
