require 'test_helper'

class ReleaserTest < Minitest::Test

  test 'has a version number' do
    refute_nil ::Releaser::VERSION
  end

end
