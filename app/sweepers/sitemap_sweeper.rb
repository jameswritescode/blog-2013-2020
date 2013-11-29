class SitemapSweeper < ActionController::Caching::Sweeper
  observe :post

  %w(after_create after_destroy).each do |method_name|
    define_method method_name do |name|
      expire_page(sitemap_path)
    end
  end
end
