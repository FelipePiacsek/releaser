require_relative '../../test_helper'
require_relative '../../../lib/releaser/views/changes_view'

class ChangesViewTest < BaseReleaserTest

  # TODO: Move me.
  def build_pull_requests(scenario = GITHUB_4_UNRELEASED_3_RELEASED)
    pr_file_content = fixture_file(scenario[:pull_requests]).read
    prs_hash = JSON.parse(pr_file_content, symbolize_names: true)

    prs_hash.map do |pr|
      user_file_path = github_user_fixture_path "#{pr[:user][:id]}.json"
      user_string = fixture_file(user_file_path).read
      user = JSON.parse(user_string, symbolize_names: true)

      PullRequest.new(pr, user)
    end
  end

  def setup
    @pull_requests = build_pull_requests
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
