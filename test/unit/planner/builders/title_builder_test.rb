require_relative '../../../test_helper'
require_relative '../../../../lib/releaser/planner/builders/title_builder'

class TitleBuilderTest < BaseReleaserTest

  test 'should correctly build title template' do
    template = template_file(TITLE_TEMPLATE_PATH).read
    vars = {title: Time.now.strftime("%Y%m%d")}

    expected_output = Releaser::Renderers.erb template, vars
    actual_output = Releaser::TitleBuilder.new.build

    assert_equal expected_output, actual_output
  end

end
