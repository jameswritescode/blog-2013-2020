class Post < ActiveRecord::Base
  validates :slug, uniqueness: true, presence: true

  def to_param
    slug
  end
end
