require_relative '../../../test_helper'
require_relative '../../../../lib/releaser/views/before_deploying_view'
require_relative '../../../fixtures/factories/pull_request_factory'
require_relative '../../../../lib/releaser/views/renderers'

class BeforeDeployingViewTest < BaseReleaserTest

  include Factories::PullRequest

  test 'should return empty string when the pull request body does not contain a before deploying section' do
    pull_requests = pull_request_list GITHUB_WITHOUT_BEFORE_DEPLOYING
    actual_result = Releaser::BeforeDeployingView.new(pull_requests).render

    assert_equal EMPTY_STRING, actual_result
  end

  test 'should return empty string when the pull request contains a before deploying section but its content is blank' do
    scenarios = [
        GITHUB_WITH_BEFORE_DEPLOYING_BUT_ONLY_WHITESPACES_IN_BODY,
        GITHUB_WITH_BEFORE_DEPLOYING_BUT_ONLY_NEWLINES_IN_BODY
    ]

    scenarios.each do |scenario|
      pull_requests = pull_request_list scenario
      actual_result = Releaser::BeforeDeployingView.new(pull_requests).render

      assert_equal EMPTY_STRING, actual_result
    end
  end

  test 'should return the rendered template when the pull request contains a non blank content in the before deploying section' do
    scenarios = [
        GITHUB_WITHOUT_AFTER_DEPLOYING_AND_WITH_BEFORE_DEPLOYING,
        GITHUB_WITH_AFTER_DEPLOYING_AND_BEFORE_DEPLOYING
    ]

    scenarios.each do |scenario|
      pull_requests = pull_request_list scenario
      actual_result = Releaser::BeforeDeployingView.new(pull_requests).render
      expected_result = expected_before_deploy scenario

      assert_equal expected_result, actual_result
    end
  end

  def expected_before_deploy(scenario, phase = 'before')
    pull_requests = pull_request_list scenario
    deploying_tasks = pull_requests.map { |pr| pr.expected_before_deploy_task }
    vars = { phase: phase, deploying_tasks: deploying_tasks}
    template = template_file(DEPLOYING_TASKS_TEMPLATE_PATH).read

    Releaser::Renderers.erb template, vars
  end

end
