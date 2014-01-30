class PostObserver < ActiveRecord::Observer
  def before_save(post)
    post.slug = post.title.parameterize
  end

  %w(after_save after_update).each do |method_name|
    define_method method_name do |post|
      post.update_column(:published_at, Time.now) if post.published? && post.published_at.nil?
    end
  end
end
