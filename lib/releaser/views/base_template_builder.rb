class BaseTemplateBuilder

  BASE_TEMPLATES_PATH = 'lib/releaser/templates'

  def template_string!(path)
    File.read "#{BASE_TEMPLATES_PATH}/#{path}"
  end
end
