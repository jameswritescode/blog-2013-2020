require 'spec_helper'

describe 'Analytics collection' do
  it 'increments root metric when root path is visited' do
    visit root_path

    expect(Metric.where(name: 'main').count).to eql 1
  end

  it 'increments post metric when post is visited' do
    post = create(:post, published: true)

    visit read_post_path(post)

    expect(post.metrics.count).to eql 1
  end
end
