require 'spec_helper'

describe Metric do
  let(:post) { create(:post) }

  describe '.tick' do
    it 'creates a new metric object when a tick is created' do
      expect(post.metrics.count).to eql 0

      Metric.tick(post)

      expect(post.metrics.count).to eql 1
      expect(Metric.first.post).to eql post
    end
  end
end
