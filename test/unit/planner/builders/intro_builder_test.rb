require_relative '../../../test_helper'
require_relative '../../../../lib/releaser/planner/builders/intro_builder'

class IntroBuilderTest < BaseReleaserTest

  test 'should correctly build intro template for given pull requests' do
    pull_requests = [] # Intro does not use pr data at the moment.

    expected_output = template_file(INTRO_TEMPLATE_PATH).read
    actual_output = Releaser::IntroBuilder.new(pull_requests).build

    assert_equal expected_output, actual_output
  end

end