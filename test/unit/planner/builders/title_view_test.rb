require_relative '../../../test_helper'
require_relative '../../../../lib/releaser/views/title_view'

class TitleViewTest < BaseReleaserTest

  test 'should correctly render title template' do
    template = template_file(TITLE_TEMPLATE_PATH).read
    vars = {title: Time.now.strftime("%Y%m%d")}

    expected_output = Releaser::Renderers.erb template, vars
    actual_output = Releaser::TitleView.new.build

    assert_equal expected_output, actual_output
  end

end
