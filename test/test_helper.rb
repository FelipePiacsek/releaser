$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'releaser'

require 'minitest/autorun'
require_relative 'declarative_testing'
Minitest::Test.make_my_diffs_pretty!