require_relative 'constants/paths'
require_relative '../lib/releaser'

module FileHelper
  include Paths

  def fixture_file(path)
    full_path = File.join Releaser.root, 'test/fixtures/', path
    File.open full_path
  end

  def github_user_fixture_path(path)
    File.join GITHUB_USER_PATH, path
  end

  def template_file(path)
    full_path = File.join Releaser.root, TEMPLATES_BASE_PATH, path
    File.open full_path
  end
end
