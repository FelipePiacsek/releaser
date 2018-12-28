require_relative '../renderers'
require_relative 'base_template_builder'

module Releaser
  class ChangesBuilder < BaseTemplateBuilder

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
