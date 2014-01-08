class SitemapObserver < ActiveRecord::Observer
  observe :post

  %w(after_update after_destroy).each do |method_name|
    define_method method_name do |post|
      SitemapPinger.ping if post.published?
    end
  end
end
