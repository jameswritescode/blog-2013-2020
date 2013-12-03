class SitemapObserver < ActiveRecord::Observer
  observe :post

  %w(after_create after_destroy).each do |method_name|
    define_method method_name do |name|
      SitemapPinger.ping
    end
  end
end
