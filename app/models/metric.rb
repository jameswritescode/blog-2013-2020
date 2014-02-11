class Metric < ActiveRecord::Base
  belongs_to :post

  def self.tick(id, options = {})
    if id.is_a?(Post)
      create(post: id, ip: options[:ip])
    elsif id.is_a?(String)
      create(name: id, ip: options[:ip])
    end
  end
end
