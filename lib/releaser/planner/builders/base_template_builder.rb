class BaseTemplateBuilder

  BASE_TEMPLATES_PATH = 'lib/releaser/planner/templates'

  def template_string!(path)
    File.read "#{BASE_TEMPLATES_PATH}/#{path}"
  end
end