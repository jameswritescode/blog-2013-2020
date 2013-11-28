class Post < ActiveRecord::Base
  validates :slug, uniqueness: true, presence: true

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
