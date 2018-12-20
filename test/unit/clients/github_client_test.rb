require_relative '../../test_helper'
require_relative '../../../lib/releaser/models/pull_request'
require_relative '../../../test/mocks/github_client_mock'
class GithubClientTest < BaseReleaserTest
  def setup
    @mocked_client = GithubClientMock.new
  end

  test 'should return an array of PullRequest models when #pull_requests method is called for a given repository' do
    scenario_path = GITHUB_4_UNRELEASED_3_RELEASED_PATH

    expected_data = build_expected_pull_requests(scenario_path)
    pull_requests = @mocked_client.pull_requests(scenario_path)

    assert_equal expected_data.size, pull_requests.size
    expected_data.zip(pull_requests).each do |expected, actual|
      assert actual.is_a?(PullRequest)
      assert_equal expected[:id], actual.id
      assert_equal expected[:title], actual.title
      assert_equal expected[:number], actual.number
      assert_equal expected[:merge_commit_sha], actual.merge_commit_sha
      assert_equal expected[:user][:id], actual.contributor.id
      assert_equal expected[:user][:email], actual.contributor.email
      assert_equal expected[:user][:name], actual.contributor.name
    end
  end

  test 'should return an User model when #user method is called for a given user_id' do
    user_id = FELIPE_PIACSEK_GITHUB_ID
    expected_user = build_expected_user user_id
    actual_user = @mocked_client.user user_id

    assert actual_user.is_a?(User)
    assert_equal expected_user[:id], actual_user.id
    assert_equal expected_user[:name], actual_user.name
    assert_equal expected_user[:email], actual_user.email
    assert_equal expected_user[:login], actual_user.login
  end

  def build_expected_pull_requests(scenario_path)
    pr_file_content = fixture_file(scenario_path).read
    expected_prs = JSON.parse(pr_file_content, symbolize_names: true)

    expected_prs.each do |pr|
      user_file_path = github_user_fixture_path "#{pr[:user][:id]}.json"
      user_string = fixture_file(user_file_path).read
      pr[:user] = JSON.parse(user_string, symbolize_names: true)
    end

    expected_prs
  end

  def build_expected_user(user_id)
    user_file_path = github_user_fixture_path "#{user_id}.json"
    user_string = fixture_file(user_file_path).read
    JSON.parse(user_string, symbolize_names: true)
  end
end