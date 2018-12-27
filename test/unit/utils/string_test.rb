require_relative '../../test_helper'
require_relative '../../../lib/releaser/utils/string'

class StringTest < BaseReleaserTest

  test 'should return FALSE for non blank strings' do
    NON_BLANK_STRINGS.each { |str| refute Releaser::Utils::String.blank?(str), str }
  end

  test 'should return TRUE for blank strings' do
    BLANK_STRINGS.each { |str| assert Releaser::Utils::String.blank?(str), str }
  end
end