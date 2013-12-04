class Settings < Settingslogic
  source    Rails.root.join('config', 'blog.yml')
  namespace Rails.env

  def self.hostname
    "#{https ? 'https' : 'http'}://#{domain}"
  end
end
