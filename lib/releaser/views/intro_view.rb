require_relative 'renderers'
require_relative 'base_view'

module Releaser
  class IntroView < BaseView
    def render
      Releaser::Renderers.erb template_string!('partials/intro.txt.erb')
    end
  end
end
