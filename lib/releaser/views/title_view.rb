require_relative 'renderers'
require_relative 'base_view'

module Releaser
  class TitleView < BaseView
    def build
      template = template_string!('partials/title.txt.erb')
      vars = { title: Time.now.strftime("%Y%m%d") }

      Releaser::Renderers.erb template, vars
    end
  end
end
