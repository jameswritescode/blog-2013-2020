class SitemapPinger
  SEARCH_ENGINES = {
    google: 'http://www.google.com/webmasters/tools/ping?sitemap=%s',
    bing:   'http://www.bing.com/webmaster/ping.aspx?siteMap=%s'
  }

  def self.ping
    SEARCH_ENGINES.each do |name, url|
      # TODO Do not hardcore jamesnewton.com
      request  = url % CGI.escape("http://jamesnewton.com/sitemap.xml")

      Net::HTTP.get_response(URI.parse(request)) if Rails.env.production?
    end if Rails.env.production?
  end
end
