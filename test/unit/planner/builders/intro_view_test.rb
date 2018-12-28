require_relative '../../../test_helper'
require_relative '../../../../lib/releaser/views/intro_view'

class IntroViewTest < BaseReleaserTest

  test 'should correctly render intro template' do
    expected_output = template_file(INTRO_TEMPLATE_PATH).read
    actual_output = Releaser::IntroView.new.render

    assert_equal expected_output, actual_output
  end

end
