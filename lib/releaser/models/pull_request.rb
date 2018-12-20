require_relative 'releaser_model'
require_relative 'user'

## PullRequest model. As the contributor info is lazily fetched via API,
# it receives two parameters on initialization:
# 1) The pull request data hash
# 2) The contributor data hash
class PullRequest < ReleaserModel
  def initialize(pr_attrs, contributor_attrs = {})
    super(pr_attrs)
    @contributor = contributor_attrs.empty? ? nil : User.new(contributor_attrs)
  end

  attr_reader :contributor
end