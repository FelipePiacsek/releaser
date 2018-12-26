require_relative '../renderers'
require_relative 'base_template_builder'

module Releaser
  class IntroBuilder < BaseTemplateBuilder

    def initialize(pull_requests)
      @pull_requests = pull_requests
    end

    def build
      Releaser::Renderers.erb template_string!('partials/intro.txt.erb')
    end
  end
end