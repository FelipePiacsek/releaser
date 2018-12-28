require_relative '../../../test_helper'
require_relative '../../../../lib/releaser/views/tag_view'

class TagViewTest < BaseReleaserTest

  test 'should correctly render tag template' do
    template = template_file(TAG_TEMPLATE_PATH).read
    vars = {tag: Time.now.strftime("%Y%m%d")}

    expected_output = Releaser::Renderers.erb template, vars
    actual_output = Releaser::TagView.new.build

    assert_equal expected_output, actual_output
  end

end
