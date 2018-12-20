$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'releaser'
require 'minitest/autorun'
require_relative 'declarative_testing'
require_relative 'constants/fake_data'
require_relative 'file_helper'

class BaseReleaserTest < Minitest::Test
  include FakeData
  include FileHelper
  Minitest::Test.make_my_diffs_pretty!
end