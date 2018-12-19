require_relative 'releaser_model'
require_relative 'user'

## Repository model. As the contributor info is lazily fetched via API,
# it receives two parameters on initialization:
# 1) The repo hash
# 2) The contributor hash
class Repository < ReleaserModel
  def initialize(repo_attrs, contributor_attrs = {})
    super(repo_attrs)
    @contributor = contributor_attrs.empty? ? nil : User.new(contributor_attrs)
  end

  attr_reader :contributor
end