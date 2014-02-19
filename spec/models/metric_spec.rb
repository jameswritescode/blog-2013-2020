require 'spec_helper'

describe Metric do
  let(:post)    { create(:post) }
  let(:request) { OpenStruct.new(ip: '127.0.0.1', referer: 'http://google.com') }

  describe '.tick' do
    it 'creates a new metric object when a tick is created' do
      expect(post.metrics.count).to eql 0

      Metric.tick(post, request)

      expect(post.metrics.count).to eql 1

      metric = Metric.first

      expect(metric.post).to eql post
      expect(metric.ip).to eql request.ip
      expect(metric.referer).to eql request.referer
    end
  end
end
