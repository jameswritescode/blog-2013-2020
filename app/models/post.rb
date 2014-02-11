class Post < ActiveRecord::Base
  validates :slug,    uniqueness: true
  validates :title,   presence: true
  validates :content, presence: true

  scope :published, -> { where(published: true).order('published_at DESC') }
  scope :ideas,     -> { where(published: false) }

  has_many :metrics

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

  def date_time
    decide_time.strftime('%Y-%m-%d')
  end

  def readable_time
    decide_time.strftime('%b %d, %Y')
  end

  def to_param
    slug
  end

  private

  def decide_time
    published? ? published_at : updated_at
  end
end
