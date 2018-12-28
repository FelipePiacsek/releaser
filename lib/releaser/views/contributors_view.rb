require_relative 'renderers'
require_relative 'base_view'

module Releaser
  class ContributorsView < BaseView

    def initialize(pull_requests)
      @pull_requests = pull_requests
    end

    def render
      template = template_string!('partials/contributors.txt.erb')
      contributors = @pull_requests.map(&:contributor).uniq { |c| c.id }
      vars = { contributors: contributors }

      Releaser::Renderers.erb template, vars
    end
  end
end
