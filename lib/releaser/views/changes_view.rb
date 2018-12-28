require_relative 'renderers'
require_relative 'base_view'

module Releaser
  class ChangesView < BaseView

    def initialize(pull_requests)
      @pull_requests = pull_requests
    end

    def build
      template = template_string!('partials/changes.txt.erb')
      vars = { pull_requests: @pull_requests }

      Releaser::Renderers.erb template, vars
    end
  end
end
