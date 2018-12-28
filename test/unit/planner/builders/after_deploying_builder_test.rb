require_relative '../../../test_helper'
require_relative '../../../../lib/releaser/views/after_deploying_builder'
require_relative '../../../fixtures/factories/pull_request_factory'
require_relative '../../../../lib/releaser/views/renderers'

class AfterDeployingBuilderTest < BaseReleaserTest

  include Factories::PullRequest

  test 'should return empty string when the pull request body does not contain an after deploying section' do
    pull_requests = pull_request_list GITHUB_WITHOUT_AFTER_DEPLOYING
    actual_result = Releaser::AfterDeployingBuilder.new(pull_requests).build

    assert_equal EMPTY_STRING, actual_result
  end

  test 'should return empty string when the pull request contains an after deploying section but its content is blank' do
    scenarios = [
        GITHUB_WITH_AFTER_DEPLOYING_BUT_ONLY_WHITESPACES_IN_BODY,
        GITHUB_WITH_AFTER_DEPLOYING_BUT_ONLY_NEWLINES_IN_BODY
    ]

    scenarios.each do |scenario|
      pull_requests = pull_request_list scenario
      actual_result = Releaser::AfterDeployingBuilder.new(pull_requests).build

      assert_equal EMPTY_STRING, actual_result
    end
  end

  test 'should return the rendered template when the pull request contains a non blank content in the after deploying section' do
    scenario = GITHUB_WITH_AFTER_DEPLOYING_AND_NON_BLANK_BODY
    expected_result = expected_after_deploy scenario
    pull_requests = pull_request_list scenario
    actual_result = Releaser::AfterDeployingBuilder.new(pull_requests).build

    assert_equal expected_result, actual_result
  end

  def expected_after_deploy(scenario, phase = 'after')
    pull_requests = pull_request_list scenario
    deploying_tasks = pull_requests.map { |pr| pr.expected_after_deploy_task }
    vars = { phase: phase, deploying_tasks: deploying_tasks}
    template = template_file(DEPLOYING_TASKS_TEMPLATE_PATH).read

    Releaser::Renderers.erb template, vars
  end

end
