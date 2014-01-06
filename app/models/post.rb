class Post < ActiveRecord::Base
  validates :slug,    presence: true, uniqueness: true
  validates :title,   presence: true
  validates :content, presence: true

  default_scope { order('created_at DESC') }

  scope :published, -> { where(published: true) }
  scope :ideas,     -> { where(published: false) }

  def idea?
    !published
  end

  def status
    published? ? 'published' : 'idea'
  end

  def read_time
    (word_count / 180).floor
  end

  def word_count
    content.split.length
  end

  def to_param
    slug
  end
end
