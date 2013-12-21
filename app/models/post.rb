class Post < ActiveRecord::Base
  validates :slug, uniqueness: true, presence: true

  scope :published, -> { where(published: true).order('id DESC') }
  scope :idea, -> { where(published: false) }

  def word_count
    content.split.length
  end

  def read_time
    (word_count / 180).floor
  end

  def to_param
    slug
  end
end
