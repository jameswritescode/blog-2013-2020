class SitemapSweeper < ActionController::Caching::Sweeper
  observe :post

  %w(after_update after_destroy).each do |method_name|
    define_method method_name do |post|
      expire_page(sitemap_path) if post.published?
    end
  end
end
