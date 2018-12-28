require_relative '../../test_helper'
require_relative '../../../lib/releaser/views/contributors_view'
require_relative '../../fixtures/factories/pull_request_factory'

class ContributorsViewTest < BaseReleaserTest

  include Factories::PullRequest

  test 'should correctly render contributors template for non empty pull requests array' do
    scenario = GITHUB_4_UNRELEASED_3_RELEASED
    pull_requests = pull_request_list scenario

    expected_output = retrieve_expected_output scenario
    actual_output = Releaser::ContributorsView.new(pull_requests).render

    assert_equal expected_output, actual_output
  end

  def retrieve_expected_output(scenario)
    fixture_file(scenario[:contributors]).read
  end

end
