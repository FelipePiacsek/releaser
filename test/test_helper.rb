$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'releaser'
require 'minitest/autorun'
require_relative 'declarative_testing'
require_relative 'fake_data_constants'

class BaseReleaserTest < Minitest::Test
  include FakeData
  Minitest::Test.make_my_diffs_pretty!
end