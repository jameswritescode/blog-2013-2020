class Metric < ActiveRecord::Base
  belongs_to :post

  def self.tick(id, request)
    if id.is_a?(Post)
      create(post: id, ip: request.ip, referer: request.referer)
    elsif id.is_a?(String)
      create(name: id, ip: request.ip, referer: request.referer)
    end
  end
end
