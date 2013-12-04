module Blog
  REVISION = `git log --pretty=format:'%h' -n 1`

  def self.config
    Settings
  end
end
