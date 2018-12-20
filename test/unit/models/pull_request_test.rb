require_relative '../../test_helper'
require_relative '../../../lib/releaser/models/pull_request'

class PullRequestTest < BaseReleaserTest
  def setup
    @pr_attrs = {id: PR_ID, name: PR_NAME }
    @contributor_attrs = { id: USER_ID, name: USER_NAME }
  end

  test 'should be able to instantiate a pull_request model without contributor' do
    pull_request = PullRequest.new @pr_attrs
    assert_nil pull_request.contributor
    assert_equal pull_request.name, @pr_attrs[:name]
    assert_equal pull_request.id, @pr_attrs[:id]
  end

  test 'should be able to instantiate a pull_request model with contributor' do
    pull_request = PullRequest.new @pr_attrs, @contributor_attrs

    assert_equal pull_request.name, @pr_attrs[:name]
    assert_equal pull_request.id, @pr_attrs[:id]
    assert_equal pull_request.contributor.id, @contributor_attrs[:id]
    assert_equal pull_request.contributor.name, @contributor_attrs[:name]
  end
end
