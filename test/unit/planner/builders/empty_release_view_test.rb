require_relative '../../../test_helper'
require_relative '../../../../lib/releaser/views/empty_release_view'
require_relative '../../../../lib/releaser/models/tag'
require_relative '../../../../lib/releaser/views/renderers'

class EmptyReleaseViewTest < BaseReleaserTest

  # TODO: Move me. Should be reusable across tests
  def tag(scenario = GITHUB_4_UNRELEASED_3_RELEASED)
    pr_file_content = fixture_file(scenario[:tags]).read
    t = JSON.parse(pr_file_content, symbolize_names: true).first
    Tag.new(t)
  end

  def setup
    @last_release = tag
  end

  test 'should correctly render an empty release template for not nil last_release' do
    template = template_file(EMPTY_RELEASE_TEMPLATE_PATH).read
    vars = {last_release_title: @last_release.name}
    expected_output = Releaser::Renderers.erb template, vars
    actual_output = Releaser::EmptyReleaseView.new(@last_release).build

    assert_equal expected_output, actual_output
  end

  test 'should correctly render an empty release template for nil last_release' do
    template = template_file(EMPTY_RELEASE_TEMPLATE_PATH).read
    expected_output = Releaser::Renderers.erb template
    actual_output = Releaser::EmptyReleaseView.new(nil).build

    assert_equal expected_output, actual_output
  end

end
