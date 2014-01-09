require 'spec_helper'

describe 'Dashboard Management' do
  before do
    4.times { create(:post) }

    login_as(:user)
  end

  it 'changes form values when another post is selected', js: true do
    find('div.posts button').click()
    find("div.posts li[data-slug='#{Post.last.slug}']").click()

    sleep 1

    title   = find('input[name="post[title]"]').value
    content = find('textarea').value

    expect(title).to eql Post.last.title
    expect(content).to eql Post.last.content
  end
end
