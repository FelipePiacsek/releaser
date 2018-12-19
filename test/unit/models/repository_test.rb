require_relative '../../test_helper'
require_relative '../../../lib/releaser/models/repository'

class RepositoryTest < BaseReleaserTest
  def setup
    @repo_attrs = { id: REPO_ID, name: REPO_NAME }
    @contributor_attrs = { id: USER_ID, name: USER_NAME }
  end

  test 'should be able to create a repository without contributor' do
    repository = Repository.new @repo_attrs
    assert_nil repository.contributor
    assert_equal repository.name, @repo_attrs[:name]
    assert_equal repository.id, @repo_attrs[:id]
  end

  test 'should be able to create a repository with contributor' do
    repository = Repository.new @repo_attrs, @contributor_attrs

    assert_equal repository.name, @repo_attrs[:name]
    assert_equal repository.id, @repo_attrs[:id]
    assert_equal repository.contributor.id, @contributor_attrs[:id]
    assert_equal repository.contributor.name, @contributor_attrs[:name]
  end
end
