class Post < ActiveRecord::Base
  validates :slug, uniqueness: true, presence: true

  default_scope { order('created_at DESC') }

  scope :published, -> { where(published: true).order('id DESC') }
  scope :ideas, -> { where(published: false) }

  def word_count
    content.split.length
  end

  def idea?
    !published
  end

  def read_time
    (word_count / 180).floor
  end

  def to_param
    slug
  end
end
