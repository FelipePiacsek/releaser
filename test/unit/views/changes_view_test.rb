require_relative '../../test_helper'
require_relative '../../../lib/releaser/views/changes_view'
require_relative '../../fixtures/factories/pull_request_factory'

class ChangesViewTest < BaseReleaserTest

  include Factories::PullRequest

  def setup
    @pull_requests = pull_request_list GITHUB_4_UNRELEASED_3_RELEASED
  end

  test 'should correctly render changes template for non-empty pull requests array' do
    template = template_file(CHANGES_TEMPLATE_PATH).read
    vars = {pull_requests: @pull_requests}

    expected_output = Releaser::Renderers.erb template, vars
    actual_output = Releaser::ChangesView.new(@pull_requests).render

    assert_equal expected_output, actual_output
  end

  test 'should correctly render changes template for empty pull requests array' do
    template = template_file(CHANGES_TEMPLATE_PATH).read
    vars = {pull_requests: []}

    expected_output = Releaser::Renderers.erb template, vars
    actual_output = Releaser::ChangesView.new([]).render

    assert_equal expected_output, actual_output
  end

end
