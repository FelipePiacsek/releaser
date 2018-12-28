require_relative '../../test_helper'
require_relative '../../../lib/releaser/views/full_release_view'
require_relative '../../fixtures/factories/pull_request_factory'

class FullReleaseViewTest < BaseReleaserTest

  include Factories::PullRequest

  test 'should correctly render full release template' do
    scenarios = [
        GITHUB_4_UNRELEASED_3_RELEASED,
        GITHUB_WITH_AFTER_DEPLOYING_AND_BEFORE_DEPLOYING
    ]

    scenarios.each do |scenario|
      pull_requests = pull_request_list(scenario).reject(&:released)

      expected_output = fixture_file(scenario[:full_release]).read % { time: Time.now.strftime('%Y%m%d') }
      actual_output = Releaser::FullReleaseView.new(pull_requests).render

      assert_equal expected_output, actual_output
    end
  end

end
