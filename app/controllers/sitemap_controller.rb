class SitemapController < ApplicationController
  expose(:posts)

  caches_page :index

  def index
    headers['Content-Type'] = 'application/xml'
  end
end
