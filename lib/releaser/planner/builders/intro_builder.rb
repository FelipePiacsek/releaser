require_relative '../renderers'
require_relative 'base_template_builder'

module Releaser
  class IntroBuilder < BaseTemplateBuilder
    def build
      Releaser::Renderers.erb template_string!('partials/intro.txt.erb')
    end
  end
end