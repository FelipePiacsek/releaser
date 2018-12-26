require_relative 'constants/paths'

module FileHelper
  include Paths

  def fixture_file(path)
    File.open "test/fixtures/#{path}"
  end

  def github_user_fixture_path(path)
    "#{GITHUB_USER_PATH}/#{path}"
  end

  def template_file(path)
    File.open "#{TEMPLATES_BASE_PATH}/#{path}"
  end
end
