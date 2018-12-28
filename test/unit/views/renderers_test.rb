require_relative '../../test_helper'
require_relative '../../../lib/releaser/views/renderers'

class RenderersTest < BaseReleaserTest

  test 'should correctly render an erb template for a valid erb template and vars' do
    vars = {this_word: NON_EMPTY_STRING}
    expected_result = VALID_ERB_TEMPLATE.gsub('<%= this_word %>', NON_EMPTY_STRING)

    actual_result = Releaser::Renderers.erb VALID_ERB_TEMPLATE, vars

    assert_equal expected_result, actual_result
  end

  test 'should correctly render an erb template for a valid erb template even if no vars are given' do
    expected_result = VALID_ERB_TEMPLATE.gsub('<%= this_word %>', EMPTY_STRING)

    actual_result = Releaser::Renderers.erb VALID_ERB_TEMPLATE

    assert_equal expected_result, actual_result
  end
end
