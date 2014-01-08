xml.urlset(xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9') do
  posts.each do |post|
    xml.url do
      xml.loc "#{root_url}#{post.slug}"
      xml.lastmod post.updated_at.strftime('%F')
      xml.changefreq 'monthly'
    end if post.published?
  end
end
