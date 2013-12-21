require 'spec_helper'

describe Post do
  context 'post creation' do
    let(:post) { create(:post) }

    it { expect(post).to be_valid }

    it 'converts to html from markdown' do
      post.content = 'This is **a** post [with markdown](http://google.com)'

      expect(Blog::Markdown.new(post.content).render).to eql <<-CONTENT
<p>This is <strong>a</strong> post <a href="http://google.com">with markdown</a></p>
      CONTENT
    end
  end

  context 'post functions' do
    let(:post) { create(:post, content: 'word ' * 1000) }

    it { expect(post.word_count).to eql 1000 }
    it { expect(post.read_time).to eql 5 }
  end

  describe 'scopes' do
    context 'published' do
      it 'has objects when there are published posts' do
        2.times { FactoryGirl.create(:post, published: true) }

        expect(Post.published.count).to eql 2
      end
    end

    context 'ideas' do
      it 'has objects when there are unpublished posts' do
        2.times { FactoryGirl.create(:post) }

        expect(Post.ideas.count).to eql 2
      end
    end
  end
end
