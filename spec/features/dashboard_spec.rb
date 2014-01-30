require 'spec_helper'

describe 'Dashboard Management' do
  before do
    4.times { create(:post) }

    login_as(:user)
  end

  it 'creates a new post', js: true do
    title   = 'Some new post title'
    content = 'Some new post content'

    fill_in 'post_title',   with: title
    fill_in 'post_content', with: content

    sleep 1

    expect(Post.first.title).to eql title
    expect(Post.first.content).to eql content
    expect(Post.first.idea?).to be_true
  end

  it 'publishes a post', js: true do
    find('div.posts button').click
    find("div.posts li[data-slug='#{Post.last.slug}']").click
    find('div.menu button').click
    find('div.menu').click_link('Publish')

    sleep 1

    expect(Post.last.published?).to be_true
  end

  it 'changes form values when another post is selected', js: true do
    find('div.posts button').click
    find("div.posts li[data-slug='#{Post.last.slug}']").click

    sleep 1

    expect(find('input.title').value).to eql Post.last.title
    expect(find('textarea').value).to eql Post.last.content
  end

  it 'deletes a post', js: true do
    post = Post.last

    find('div.posts button').click
    find("div.posts li[data-slug='#{post.slug}']").click
    find('div.menu button').click
    find('div.menu').click_link('Delete')

    sleep 1

    expect(find('input.title').value).to eql ''
    expect(find('textarea').value).to eql ''

    expect { Post.find(post.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
